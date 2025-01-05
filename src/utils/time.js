function convertTimeToSeconds(time) {
    if (!time || typeof time !== "string") return null;

    const unit = time.slice(-1);
    const value = parseInt(time.slice(0, -1));

    if (isNaN(value)) return null;

    const conversionFactors = {
        s: 1,
        m: 60,
        h: 3600,
        d: 86400,
        w: 604800,
        M: 2592000,
        y: 31536000,
    };

    return conversionFactors[unit] ? value * conversionFactors[unit] : null;
}

export { convertTimeToSeconds };