import { defineConfig } from 'tsup';

export default defineConfig([{
  entry: ['src/index.ts'],
  target: 'node18',
  format: ['cjs'],
  outDir: 'dist',
  clean: true,
  dts: false,
  minify: true,
  shims: false,
  splitting: false,
  sourcemap: false,
},
{
  entry: ['src/create.ts'],
  target: 'node18',
  format: ['cjs'],
  outDir: 'dist',
  clean: true,
  dts: false,
  minify: true,
  shims: false,
  splitting: false,
  sourcemap: false,
}
]);
