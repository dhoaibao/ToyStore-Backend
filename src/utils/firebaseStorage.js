import {
  ref,
  uploadBytes,
  getDownloadURL,
} from "firebase/storage";
import { storage } from "../config/firebaseConfig";
import { decode } from "base64-arraybuffer";

export const uploadFile = async (file) => {
  try {
    const fileName = file.originalname + "-" + Date.now();

    const storageRef = ref(storage, `images/${fileName}`);

    const fileBase64 = decode(file.buffer.toString("base64"));

    const metadata = {
      contentType: file.mimetype,
    };

    const upload = await uploadBytes(storageRef, fileBase64, metadata);

    const filePath = upload.metadata.fullPath;
    const url = await getDownloadURL(upload.ref);

    return { filePath, url };
  } catch (error) {
    throw error;
  }
};

export const uploadMultipleFiles = async (files) => {
  try {
    const uploadResults = await Promise.all(
      files.map(async (file) => {
        const { url, filePath } = await uploadFile(file);
        return { url, filePath };
      }),
    );

    return uploadResults;
  } catch (error) {
    throw error;
  }
};

export const uploadFileFromUrl = async (url) => {
  try {
    const fileName = path.basename(url);

    const response = await fetch(url, {
      method: "GET",
    });
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const arrayBuffer = await response.arrayBuffer();
    const buffer = Buffer.from(arrayBuffer);

    const { url: uploadedUrl, filePath } = await uploadFile({
      buffer,
      originalname: fileName,
      mimetype: response.headers.get("content-type"),
    });

    return { url: uploadedUrl, filePath };
  } catch (error) {
    throw error;
  }
};

export const deleteFile = async (filePath) => {
  try {
    const desertRef = ref(storage, filePath);
    await deleteObject(desertRef);
  } catch (error) {
    throw error;
  }
};
