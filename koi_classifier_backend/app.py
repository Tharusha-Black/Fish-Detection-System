import tensorflow as tf
import cv2
import numpy as np
import os
from tensorflow import keras
from werkzeug.utils import secure_filename
import os
import sqlite3
from flask import Flask, request, jsonify, g
from werkzeug.utils import secure_filename

app = Flask(__name__)
UPLOAD_FOLDER = 'assets'
IMG_PATH = '../koi_classifier_flutter/assets'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['IMG_PATH'] = IMG_PATH
DATABASE = 'users.db'

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

# Database setup
def init_db():
    with sqlite3.connect('users.db') as conn:
        conn.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT NOT NULL UNIQUE,
                password TEXT NOT NULL,
                firstname TEXT NOT NULL,
                lastname TEXT NOT NULL,
                email TEXT NOT NULL UNIQUE,
                mobile TEXT NOT NULL,
                user_image TEXT
            );
        ''')

init_db()

@app.route('/register', methods=['POST'])
def register():
    try:
        data = request.form
        username = data['username']
        password = data['password']
        firstname = data['firstname']
        lastname = data['lastname']
        email = data['email']
        mobile = data['mobile']
        user_image = request.files.get('userImage')

        if user_image:
            filename = secure_filename(user_image.filename)
            image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            frontend_path = os.path.join(app.config['IMG_PATH'], filename)
            user_image.save(frontend_path)
        else:
            image_path = None

        with sqlite3.connect('users.db') as conn:
            cursor = conn.cursor()
            cursor.execute('''
                INSERT INTO users (username, password, firstname, lastname, email, mobile, user_image)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            ''', (username, password, firstname, lastname, email, mobile, image_path))
            conn.commit()

        return jsonify({'message': 'User registered successfully'}), 200

    except sqlite3.IntegrityError as e:
        if 'UNIQUE constraint failed' in str(e):
            return jsonify({'error': 'User with this username or email already exists'}), 400
        else:
            return jsonify({'error': str(e)}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    
    with sqlite3.connect('users.db') as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users WHERE username = ? AND password = ?', (username, password))
        user = cursor.fetchone()
    
    if user:
        # Assuming you're generating a token (implement your token generation logic)
        token = 'your_generated_token'
        response = {
            'token': token,
            'username': user[1],
            'firstname': user[3],
            'lastname': user[4],
            'email': user[5],
            'mobile': user[6],
            'userImage': user[7]
        }
        return jsonify(response), 200
    else:
        return jsonify({'error': 'Invalid username or password'}), 401

@app.route('/logout', methods=['POST'])
def logout():
    return jsonify({'message': 'Logged out successfully'}), 200

# Function to load the model
def load_saved_model(model_dir):
    if not os.path.exists(model_dir):
        raise FileNotFoundError(f"Model directory not found at {model_dir}")
    try:
        model_layer = keras.layers.TFSMLayer(model_dir, call_endpoint='serving_default')
        
        # Define the input shape explicitly
        input_shape = (224, 224, 3)
        input_layer = keras.layers.InputLayer(input_shape=input_shape)
        
        model = keras.Sequential([input_layer, model_layer])
        print(f"Model loaded successfully from {model_dir}")
        
        # Assert the model input shape
        assert model.input_shape == (None, 224, 224, 3), f"Unexpected model input shape: {model.input_shape}"
        
        return model
    except Exception as e:
        print(f"Error loading model: {e}")
        return None
    
@app.route('/user_profile', methods=['GET'])
def user_profile():
    print('entered to the user profile')
    username = request.args.get('username')
    if not username:
        return jsonify({'error': 'Username is required'}), 400
    
    with sqlite3.connect(DATABASE) as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users WHERE username = ?', (username,))
        user = cursor.fetchone()
    
    if user:
        response = {
            'username': user[1],
            'firstname': user[3],
            'lastname': user[4],
            'email': user[5],
            'mobile': user[6],
            'userImage': user[7]
        }
        return jsonify(response), 200
    else:
        return jsonify({'error': 'User not found'}), 404



model_dir = "modelpb"  # Path to the SavedModel directory
model = load_saved_model(model_dir)
print("Model:", model)

# Function to preprocess the image
def preprocess_image(image_path):
    img_height, img_width = 224, 224
    image = cv2.imread(image_path)
    if image is None:
        raise FileNotFoundError(f"Image file not found at {image_path}")
    image_resized = cv2.resize(image, (img_height, img_width))
    image_array = np.expand_dims(image_resized, axis=0)
    image_array = tf.keras.applications.vgg16.preprocess_input(image_array)
    return image_array

# Function to classify an image
@app.route('/classify', methods=['POST'])
def classify_image():
    try:
        # Check if an image was uploaded
        if 'image' not in request.files:
            return jsonify({'error': 'No image provided'}), 400

        # Get the uploaded file
        uploaded_file = request.files['image']
        if uploaded_file.filename == '':
            return jsonify({'error': 'No selected file'}), 400

        # Save the uploaded file to disk
        filename = secure_filename(uploaded_file.filename)
        file_path = os.path.join(UPLOAD_FOLDER, filename)
        uploaded_file.save(file_path)

        # Preprocess the uploaded image
        image = preprocess_image(file_path)
        pred_dict = model.predict(image)
        pred_key = list(pred_dict.keys())[0]
        pred = pred_dict[pred_key]

        class_names = ['Hiutsuri', 'Kohaku', 'Showa']
        class_descriptions = {
            'Hiutsuri': ' Hiutsuri is a type of Koi characterized by its distinct pattern of black and white markings. It typically has a predominantly black body with white patches or vice versa. The contrast between black and white creates a striking and attractive appearance.',
            'Kohaku': 'Kohaku is one of the most popular varieties of Koi known for its simple yet elegant pattern. It features a solid white body with red markings called "hi." The hi can vary in intensity, ranging from deep red to pale orange, creating a beautiful contrast against the white background',
            'Showa': 'Showa is a striking variety of Koi with a black body adorned with red and white markings. Unlike Kohaku, Showa has black patterns called "sumi" overlaid on the white base. The sumi can vary in intensity and distribution, giving each Showa a unique and dynamic appearance.'
        }
        output_class = class_names[np.argmax(pred)]
        description = class_descriptions.get(output_class, 'No description available')
        probability = float(str(round(max(pred[0]), 4)))

        # Debugging: Print raw predictions
        print(f"Predictions: {pred}")
        print(f"Class probabilities: {list(zip(class_names, pred[0]))}")

        response_data = {
            'class': output_class,
            'description': description,
            'probability': probability
        }
        
        return jsonify(response_data), 200
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500


# Main script
if __name__ == '__main__':
    # Initialize the database
    if not os.path.exists(DATABASE):
        init_db()
    app.run(debug=True, host='0.0.0.0', port=5000)
