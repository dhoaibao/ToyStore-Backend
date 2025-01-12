import prisma from '../config/prismaClient.js'
import uploadFile from '../utils/supabaseStorage.js';

export const uploadSingleImage = async (file) => {
    try {
        const { url } = await uploadFile(file);

        const image = await prisma.uploadImage.create({
            data: { url: url }
        });

        return image;

    } catch (error) {
        console.error('Error uploading file:', error);
        throw new Error('Error uploading file');
    }
}

export const uploadMultipleImages = async (files) => {
    try {
        const uploadResults = await Promise.all(
            files.map(async (file) => {
                const { url } = await uploadFile(file);
                return url;
            })
        );

        const images = await Promise.all(
            uploadResults.map(async (url) => {
                return await prisma.uploadImage.create({
                    data: { url }
                });
            })
        );

        return images;
    } catch (error) {
        console.error('Error uploading files:', error);
        throw new Error('Error uploading files');
    }
}

export const uploadFromUrl = async (url) => {
    try {
        const image = await prisma.uploadImage.create({
            data: { url }
        });

        return image;
    } catch (error) {
        console.error('Error uploading file:', error);
        throw new Error('Error uploading file');
    }
}