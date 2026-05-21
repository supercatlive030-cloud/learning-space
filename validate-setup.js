#!/usr/bin/env node

/**
 * Validation script for The Cats Arcade setup
 * Run: node validate-setup.js
 */

const fs = require('fs');
const path = require('path');

console.log('\n🐱 Validating Cats Arcade Setup...\n');

const checks = [
  {
    name: 'package.json exists',
    test: () => fs.existsSync('package.json'),
  },
  {
    name: 'server.js exists',
    test: () => fs.existsSync('server.js'),
  },
  {
    name: 'index.html exists',
    test: () => fs.existsSync('index.html'),
  },
  {
    name: 'js/app-refactored.js exists',
    test: () => fs.existsSync('js/app-refactored.js'),
  },
  {
    name: 'js/games.json exists',
    test: () => fs.existsSync('js/games.json'),
  },
  {
    name: '.env file exists',
    test: () => fs.existsSync('.env'),
  },
  {
    name: '.gitignore file exists',
    test: () => fs.existsSync('.gitignore'),
  },
  {
    name: 'node_modules exists',
    test: () => fs.existsSync('node_modules'),
    critical: true,
  },
];

let passed = 0;
let failed = 0;
let critical = false;

checks.forEach(check => {
  const result = check.test();
  const icon = result ? '✅' : '❌';
  console.log(`${icon} ${check.name}`);
  
  if (result) {
    passed++;
  } else {
    failed++;
    if (check.critical) {
      critical = true;
    }
  }
});

console.log(`\n📊 Results: ${passed}/${checks.length} passed\n`);

if (critical) {
  console.log('⚠️  Critical dependencies missing!');
  console.log('Run: npm install\n');
  process.exit(1);
}

if (failed > 0) {
  console.log(`⚠️  ${failed} file(s) missing. Check your directory structure.\n`);
  process.exit(1);
}

console.log('✅ Setup looks good! Ready to run: npm start\n');

// Check .env configuration
if (fs.existsSync('.env')) {
  const envContent = fs.readFileSync('.env', 'utf8');
  const hasApiKey = envContent.includes('AI_API_KEY=') && !envContent.match(/AI_API_KEY=\s*$/m);
  
  console.log('🔐 AI Configuration:');
  console.log(`   ${hasApiKey ? '✅' : '⚠️ '} AI_API_KEY: ${hasApiKey ? 'Configured' : 'Not configured (fallback enabled)'}`);
  console.log('');
}

process.exit(0);
