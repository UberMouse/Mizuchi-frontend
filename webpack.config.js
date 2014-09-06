/**
 * Created by Taylor on 4/09/14.
 */
var webpack = require('webpack');
var path = require('path');

module.exports = {
    entry: [
        'webpack-dev-server/client?http://localhost:3000',
        'webpack/hot/dev-server',
        './javascripts/boot.coffee'
    ],
    devtool: "eval",
    output: {
        path: __dirname,
        filename: 'bundle.js',
        publicPath: ''
    },
    resolve: {
        // Allow to omit extensions when requiring these files
        extensions: ['', '.js', '.jsx', '.coffee', '.cjsx'] ,
        root: path.join(__dirname, 'javascripts')
    },
    module: {
        loaders: [
            { test: /\.cjsx/, loaders: ['coffee', 'react-hot'] },
            { test: /\.coffee$/, loader: 'coffee'}
        ]
    },
    plugins: [
        new webpack.HotModuleReplacementPlugin()
    ]
};
