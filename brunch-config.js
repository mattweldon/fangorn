module.exports = {
  files: {
    javascripts: {
      joinTo: {
        'public/js/app.js': /^app/
      }
    },
    stylesheets: {
      joinTo: 'css/app.css'
    }
  },

  server: {
    port: 3000
  },

  paths: {
    // Which directories to watch
    watched: ["src", "lib", "scss"],

    // Where to compile files to
    public: "public"
  },

  plugins: {
    elmBrunch: {
      mainModules: ["src/Main.elm"]
    },
    sass: {
      allowCache: true
    }
  }
};
