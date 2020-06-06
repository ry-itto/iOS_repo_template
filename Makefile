BUNDLE_IDENTIFIER:=com.example.template.Template
PROJECT_NAME:=Test

.PHONY: init
init:
	./scripts/bootstrap.sh $(PROJECT_NAME) $(BUNDLE_IDENTIFIER)
