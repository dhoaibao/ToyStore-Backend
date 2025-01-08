import prisma from '../config/prismaClient.js'
import uploadFile from '../utils/cloudinary.js';
import fs from "fs/promises";
import { generateImageEmbedding } from '../utils/generateEmbeddings.js';

export const uploadSingleImage = async (filePath) => {
    try {
        const { url, publicId } = await uploadFile(filePath);

        const embeddings = await generateImageEmbedding(url);

        const image = await prisma.uploadImage.create({
            data: {
                url,
                publicId,
            }
        });

        await fs.unlink(filePath);

        return { image, embeddings };

    } catch (error) {
        console.error('Error uploading file:', error);
    }
}

export const uploadMultipleImages = async (filePaths) => {
    try {
        const fileUploadResults = await Promise.all(filePaths.map(async (filePath) => {
            try {
                const { url, publicId } = await uploadFile(filePath);
                const embeddings = await generateImageEmbedding(url);
                await fs.unlink(filePath);
                return { url, publicId, embeddings };
            } catch (error) {
                console.error(`Error uploading file at ${filePath}:`, error);
                throw new Error(`Failed to upload file at ${filePath}`);
            }
        }));

        const savedImages = await Promise.all(fileUploadResults.map(async ({ url, publicId, embeddings }) => {
            try {
                const image = await prisma.uploadImage.create({
                    data: {
                        url,
                        publicId,
                    }
                });
                return { image, embeddings };
            } catch (error) {
                console.error('Error saving image to database:', error);
                throw new Error('Failed to save image to database');
            }
        }));

        return savedImages;
    } catch (error) {
        console.error('Error uploading files:', error);
    }
}