import prisma from '../config/prismaClient.js'
import { uploadFile, deleteFile } from '../utils/supabaseStorage.js';
import path from 'path';

export const uploadSingleImage = async (file) => {
    try {
        const { url, filePath } = await uploadFile(file);

        const image = await prisma.uploadImage.create({
            data: { url, filePath }
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
                const { url, filePath } = await uploadFile(file);
                return { url, filePath };
            })
        );

        const images = await Promise.all(
            uploadResults.map(async ({ url, filePath }) => {
                return await prisma.uploadImage.create({
                    data: { url, filePath }
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
        const fileName = path.basename(url);

        const response = await fetch(url, {
            method: 'GET',
        });
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const arrayBuffer = await response.arrayBuffer();
        const buffer = Buffer.from(arrayBuffer);

        const { url: uploadedUrl, filePath } = await uploadFile({
            buffer,
            originalname: fileName,
            mimetype: response.headers.get('content-type'),
        });

        const image = await prisma.uploadImage.create({
            data: { url: uploadedUrl, filePath }
        });

        return image;
    } catch (error) {
        console.error('Error uploading file:', error);
        throw new Error('Error uploading file');
    }
};

export const deleteImage = async (id) => {
    try {
        const image = await prisma.uploadImage.findUnique({ where: { uploadImageId: id } });

        if (!image) {
            throw new Error('Image not found');
        }

        await prisma.uploadImage.delete({ where: { uploadImageId: id } });

        await deleteFile(image.filePath);

        return image;
    } catch (error) {
        console.error('Error deleting file:', error);
        throw new Error('Error deleting file');
    }
}