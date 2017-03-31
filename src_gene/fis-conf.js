fis.match('widget/**', {
  release: false
});
fis.match('static/*', {
  release: '$0'
});
fis.match('{page/,news/,orgs/}(**.html)', {
  release: '$1'
});
fis.match('*.{js,css,png,jpg}', {
  useHash: true
});
fis.match('static/images/org/*', {
  useHash: false
});