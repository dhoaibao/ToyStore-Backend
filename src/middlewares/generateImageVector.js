const tf = require('@tensorflow/tfjs'); // Use tfjs-node for server-side
const mobilenet = require('@tensorflow-models/mobilenet');
const fs = require('fs');
const axios = require('axios');

async function loadImage(imagePath) {
  try {
    let imageBuffer;

    if (imagePath.startsWith('http')) {
      const response = await axios.get(imagePath, { responseType: 'arraybuffer' });
      imageBuffer = Buffer.from(response.data, 'binary');
    } else {
      imageBuffer = fs.readFileSync(imagePath);
    }

    const tfImage = tf.node.decodeImage(imageBuffer);
    return tfImage;
  } catch (error) {
    console.error('Error loading image:', error);
    throw error;
  }
}

async function extractVector(imagePath) {
  let image;
  let model;
  try {
    image = await loadImage(imagePath);
    model = await mobilenet.load();
    const embeddings = model.infer(image, true);
    const vector = embeddings.arraySync();
    return vector;
  } catch (error) {
    console.error('Error extracting vector:', error);
    throw error;
  } finally {
    if (image) {
      image.dispose();
    }
    if (model) {
      model.dispose();
    }
  }
}

extractVector('https://dochoidaiviet.com/wp-content/uploads/2021/09/z2667463461583-1a7e859f2cbebbaa77030337a79914f8.jpg')
  .then((vector) => {
    console.log('Vector Embedding:', vector);
  })
  .catch((error) => {
    console.error('Error:', error);
  });

// Example usage for local file
// extractVector('./example.jpg').then((vector) => {
//   console.log('Vector Embedding:', vector);
// }).catch((error) => {
//   console.error('Error:', error);
// });