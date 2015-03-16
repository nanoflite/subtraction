(function() {
  var Grid;

  Grid = (function() {
    function Grid(minuend, subtrahend) {
      this.minuend = minuend;
      this.subtrahend = subtrahend;
    }

    Grid.prototype.draw = function() {
      var data, template;
      template = $('#grid_tpl').html();
      Mustache.parse(template);
      data = {
        minuend: this.minuend,
        subtrahend: this.subtrahend,
        md: this._d(this.minuend),
        mh: this._h(this.minuend),
        mt: this._t(this.minuend),
        me: this._e(this.minuend),
        sd: this._d(this.subtrahend),
        sh: this._h(this.subtrahend),
        st: this._t(this.subtrahend),
        se: this._e(this.subtrahend)
      };
      return Mustache.render(template, data);
    };

    Grid.prototype._d = function(n) {
      var m;
      if (n < 1000) {
        return "";
      }
      m = n % 1000;
      return (n - m) / 1000;
    };

    Grid.prototype._h = function(n) {
      var m;
      if (n < 100) {
        return "";
      }
      n = n % 1000;
      m = n % 100;
      return (n - m) / 100;
    };

    Grid.prototype._t = function(n) {
      var m;
      if (n < 10) {
        return "";
      }
      n = n % 1000;
      n = n % 100;
      m = n % 10;
      return (n - m) / 10;
    };

    Grid.prototype._e = function(n) {
      var m;
      n = n % 1000;
      n = n % 100;
      m = n % 10;
      return m;
    };

    return Grid;

  })();

  window.Grid = Grid;

}).call(this);
