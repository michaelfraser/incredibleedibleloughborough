SHELL=/bin/bash

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build project
	 rm -rf public && hugo

netlify: ## Build and deploy to Netlify
	rm -rf public && netlify deploy --prod

netlify-staging: ## Build and deploy to Netlify Staging environment
	rm -rf public && netlify deploy --alias=staging

start-hugo: ## start Hugo server
	hugo server -D

start-cms: ## start Decap CMS
	npx decap-server

start-all: ## start both Hugo server and Decap CMS
	@echo "Starting Hugo server and Decap CMS..."
	@$(MAKE) -j2 start-hugo start-cms	
