module.exports = {
  plugins: [
    require('@fullhuman/postcss-purgecss')({
      content: ['./hugo_stats.json'],
      defaultExtractor: (content) => {
        const els = JSON.parse(content).htmlElements;
        return [
          ...(els.tags || []),
          ...(els.classes || []),
          ...(els.ids || []),
        ];
      },
      safelist: {
        standard: [
          'show', 'fade', 'collapse', 'collapsing', 
          'navbar-collapse', 'is-active', 'visible', 'has-js'
        ],
        // deep: [/dropdown/, /nav/, /navbar/]
      }
    })
  ]
};