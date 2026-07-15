/* OpenStage — night mode toggle (persisted, respects OS preference by default) */
(function () {
  var KEY = 'openstage-theme';
  var saved = null;
  try { saved = localStorage.getItem(KEY); } catch (e) {}
  var initial = saved || (window.matchMedia && matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
  document.documentElement.setAttribute('data-theme', initial);

  function apply(t) {
    document.documentElement.setAttribute('data-theme', t);
    try { localStorage.setItem(KEY, t); } catch (e) {}
  }
  document.addEventListener('DOMContentLoaded', function () {
    var b = document.getElementById('themeBtn');
    if (b) b.onclick = function () {
      apply(document.documentElement.getAttribute('data-theme') === 'dark' ? 'light' : 'dark');
    };
  });
})();
