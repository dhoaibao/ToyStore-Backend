import { pipeline } from '@xenova/transformers';

export const generateImageEmbedding = async (imageUrl) => {
    try {
        const pipe = await pipeline("image-feature-extraction", "Xenova/clip-vit-base-patch32");
        const embeddings = await pipe(imageUrl);
        return Array.from(embeddings.data);
    } catch (error) {
        console.error('Error generating image embeddings:', error);
    }
}

export const generateTextEmbedding = async (text) => {
    try {
        const pipe = await pipeline("feature-extraction", "Xenova/all-MiniLM-L6-v2");
        const embeddings = await pipe(text, {
            pooling: "mean",
            normalize: true,
        });
        return Array.from(embeddings.data);
    } catch (error) {
        console.error('Error generating text embeddings:', error);
    }
}