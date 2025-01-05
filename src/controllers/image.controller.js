import prisma from '../config/prismaClient.js'
import { uploadFile } from '../utils/cloudinary.js';
import fs from "fs/promises";

export const getAllImages = async (req, res) => {
    try {
        const images = await prisma.uploadImage.findMany();

        res.status(200).json({ data: images });
    } catch (error) {
        console.error('Error fetching images:', error);
        res.status(500).json({ message: "Failed to fetch images.", error: error.message });
    }
}

export const getImageById = async (req, res) => {
    try {
        const { id } = req.params;

        const image = await prisma.uploadImage.findUnique({
            where: {
                uploadImageId: parseInt(id)
            }
        });

        if (!image) {
            return res.status(404).json({ message: "Image not found." });
        }

        res.status(200).json({ data: image });
    } catch (error) {
        console.error('Error fetching image:', error);
        res.status(500).json({ message: "Failed to fetch image.", error: error.message });
    }
}

export const uploadSingleImage = async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json({ message: "No file uploaded." });
        }

        const filePath = req.file.path;

        const { url, publicId } = await uploadFile(filePath);

        const image = await prisma.uploadImage.create({
            data: {
                url,
                publicId,
            }
        });

        await fs.unlink(filePath);

        res.status(200).json({ message: "File uploaded successfully!", data: image });
    } catch (error) {
        console.error('Error uploading file:', error);
        res.status(500).json({ message: "File upload failed.", error: error.message });
    }
}

export const uploadMultipleImages = async (req, res) => {
    try {
        if (!req.files || req.files.length === 0) {
            return res.status(400).json({ message: "No files uploaded." });
        }

        const filePaths = req.files.map((file) => file.path);

        const fileUploadResults = await Promise.all(filePaths.map(async (filePath) => {
            try {
                const { url, publicId } = await uploadFile(filePath);
                await fs.unlink(filePath);
                return { url, publicId };
            } catch (error) {
                console.error(`Error uploading file at ${filePath}:`, error);
                throw new Error(`Failed to upload file at ${filePath}`);
            }
        }));

        const savedImages = await Promise.all(fileUploadResults.map(async ({ url, publicId }) => {
            try {
                return await prisma.uploadImage.create({
                    data: {
                        url,
                        publicId,
                    }
                });
            } catch (error) {
                console.error('Error saving image to database:', error);
                throw new Error('Failed to save image to database');
            }
        }));

        res.status(200).json({ message: "Files uploaded and saved successfully!", data: savedImages });
    } catch (error) {
        console.error('Error uploading files:', error);
        res.status(500).json({ message: "File upload failed.", error: error.message });
    }
}