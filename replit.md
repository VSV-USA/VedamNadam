# Vedam Nadam - Spiritual Learning and Resources

## Overview
A modern recreation of vedam-nadam.org - a 501(C)(3) Non-Profit religious and charitable organization website. Features all sections from the original site including Home, Kavya Lahari (stotrams collection), Classes, Events, Gallery, and Contact.

## Architecture
- **Frontend**: React + Vite + TailwindCSS + shadcn/ui components
- **Backend**: Express.js REST API
- **Storage**: Dual-mode — PostgreSQL (when DATABASE_URL set) or file-based (reads from server/data.json)
- **ORM**: Drizzle ORM (for database mode)
- **Routing**: Wouter (frontend), Express (backend)

## Project Structure
- `client/src/pages/` - Page components (landing, kavya-lahari, category, narayaneeyam, search, classes, events, gallery, contact, not-found)
- `client/src/components/` - Reusable components (header with nav tabs, footer, theme-provider, theme-toggle)
- `client/public/images/` - Generated deity images for categories
- `server/` - Express server, routes, storage, seed data, database connection
- `server/data.json` - Complete stotram data as JSON (used when no database available)
- `shared/schema.ts` - Drizzle schema definitions (categories, stotrams tables)

## Data Model
- **Categories**: 8 deity categories (Ganesha, Subramanya, Shiva, Devi, Vishnu, Surya, Guru, Hanuman)
- **Stotrams**: Individual prayers with optional subcategories, video URLs, and PDF availability in 4 languages

## Pages & Routes
- `/` - Landing page (organization overview, mission, links)
- `/kavya-lahari` - Stotrams collection (8 deity category cards)
- `/kavya-lahari/:slug` - Category detail page (stotram list with filters)
- `/kavya-lahari/vishnu/narayaneeyam` - Narayaneeyam sub-page (101 dasakams)
- `/search?q=query` - Search results page
- `/classes` - Classes page (coming soon)
- `/events` - Events page (past events listed)
- `/gallery` - Gallery page (links to images/videos on vedam-nadam.org)
- `/contact` - Contact page (email and website links)

## API Routes
- `GET /api/categories` - List all categories
- `GET /api/categories/:slug` - Get single category by slug
- `GET /api/categories/:slug/stotrams` - Get stotrams for a category
- `GET /api/search?q=query` - Search stotrams by name

## Key Features
- Full site navigation with Home, Kavya Lahari, Classes, Events, Gallery, Contact tabs
- Mobile responsive hamburger menu
- Dark/light mode toggle
- Search functionality across all stotrams
- Language filter on category pages
- PDF links redirect to vedam-nadam.org category pages (not WordPress PDF files)
- YouTube video links
- Subcategory grouping for Devi stotrams
- Animated transitions with Framer Motion

## Local Hosting (No Database Required)
The app auto-detects whether a database is available:
- **With DATABASE_URL**: Uses PostgreSQL, seeds data on first run
- **Without DATABASE_URL**: Reads all data from `server/data.json` — no database setup needed
To run locally on Windows: install `cross-env` (`npm install cross-env`) and prefix NODE_ENV commands with `cross-env` in package.json scripts.

## Recent Changes
- 2026-02-18: Added file-based storage fallback for local hosting without PostgreSQL
- 2026-02-18: Narayaneeyam moved to dedicated sub-page within Vishnu Stotrams with button at top
- 2026-02-17: Expanded from Kavya Lahari only to full Vedam Nadam website with all tabs/pages
- 2026-02-17: PDF links now point to vedam-nadam.org category pages instead of WordPress uploads
- 2026-02-17: Added landing page, classes, events, gallery, contact pages
- 2026-02-17: Updated header with full navigation tabs and mobile menu
- 2026-02-17: Updated footer with organization details and nav links
