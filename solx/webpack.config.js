const webpack = require('webpack');
const path = require('path');

const config = {
    entry: './src/solx.js',
    output: {
        path: path.resolve(__dirname, '.'),
        filename: 'solx.js'
    }
};

module.exports = config;