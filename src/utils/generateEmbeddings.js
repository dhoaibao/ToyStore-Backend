const embeddingServiceUrl = process.env.EMBEDDING_SERVICE_URL;

export const generateImageEmbedding = async (formData) => {
    try {

        const response = await fetch(
            `${embeddingServiceUrl}/image`,
            {
                method: 'POST',
                body: formData,
            }
        );

        const data = await response.json();
        return data.embeddings;
    } catch (error) {
        console.error('Error generating image embeddings:', error);
    }
}

export const generateTextEmbedding = async (text) => {
    try {
        const response = await fetch(
            `${embeddingServiceUrl}/text`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ text }),
            }
        );

        const data = await response.json();
        return data.embeddings;
    } catch (error) {
        console.error('Error generating text embeddings:', error);
    }
}