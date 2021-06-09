define genRefactor
	mkdir -p $(1)
	touch $(1)/Origin.swift
	touch $(1)/Refactor.swift
	touch $(1)/Test.swift
	# -rm $(1)/Refactored.swift
endef

all: ch6 ch7 ch10

ch6:
	$(call genRefactor, Chapter6/ExtractMethod)
	$(call genRefactor, Chapter6/ExtractMethod)
	$(call genRefactor, Chapter6/InlineMethod)
	$(call genRefactor, Chapter6/InlineTemp)
	$(call genRefactor, Chapter6/ReplaceTempWithQuery)
	$(call genRefactor, Chapter6/IntroduceExplainingVariable)
	$(call genRefactor, Chapter6/SplitTemporaryVariable)
	$(call genRefactor, Chapter6/RemoveAssignmentToParameters)
	$(call genRefactor, Chapter6/REplaceMethodWithMethodObject)
	$(call genRefactor, Chapter6/SubstituteAlgorithm)

ch7:
	$(call genRefactor, Chapter7/MoveMethod)
	$(call genRefactor, Chapter7/MoveField)
	$(call genRefactor, Chapter7/ExtractClass)
	$(call genRefactor, Chapter7/InlineClass)
	$(call genRefactor, Chapter7/HideDelegate)
	$(call genRefactor, Chapter7/RemoveMiddleMan)
	$(call genRefactor, Chapter7/IntroduceForeignMethod)
	$(call genRefactor, Chapter7/IntroduceLocalExtension)

ch10:
	$(call genRefactor, Chapter10/RenameMethod)
