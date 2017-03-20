module.exports = function (config) {
  const options =
    {
      files: [
        'bundle.js',
      ],

      frameworks: [
        'mocha',
      ],

      reporters: ['progress'],

      customLaunchers: {
        Chrome_travis_ci: {
          base: 'Chrome',
          flags: ['--no-sandbox']
        }
      },

      browsers: [ 'Chrome', 'Firefox' ]
    }

  if (process.env.TRAVIS)
    options.browsers = ['Chrome_travis_ci', 'Firefox']

  config.set(options);
}