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
        throw new Error('Error uploading file');
    }
}

export const uploadMultipleImages = async (filePaths) => {
    try {
        console.time('Upload Multiple Images Time');
        const uploadResults = await Promise.all(
            filePaths.map(async (filePath) => {
                const { url, publicId } = await uploadFile(filePath);
                const embeddings = await generateImageEmbedding(url);
                await fs.unlink(filePath);
                return { url, publicId, embeddings };
            })
        );

        const imageData = uploadResults.map(({ url, publicId }) => ({
            url,
            publicId,
        }));

        const savedImages = await Promise.all(
            imageData.map(data => prisma.uploadImage.create({ data }))
        );

        const imageEmbeddings = uploadResults.map((result, index) => ({
            image: {
                url: result.url,
                publicId: result.publicId,
                uploadImageId: savedImages[index].uploadImageId,
            },
            embeddings: result.embeddings,
        }));

        console.timeEnd('Upload Multiple Images Time');

        return imageEmbeddings;
    } catch (error) {
        console.error('Error uploading files:', error);
        throw new Error('Error uploading files');
    }
}

export const uploadFromUrl = async (imageUrl) => {
    try {
        const { url, publicId } = await uploadFile(imageUrl);

        const embeddings = await generateImageEmbedding(url);

        const image = await prisma.uploadImage.create({
            data: {
                url,
                publicId,
            }
        });

        return { image, embeddings };

    } catch (error) {
        console.error('Error uploading file:', error);
        throw new Error('Error uploading file');
    }
}