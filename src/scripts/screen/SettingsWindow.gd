extends Window

var selected_language:= -1

const LANGUAGE_DICTIONARY:Dictionary = {
	"Francais": 0,
	"English": 1
}

func _ready():
	add_language_items()
	if GeoscribeManager.userSettings.isEmpty:
		return
	%DirectusURLInput.text = GeoscribeManager.userSettings.directus_url
	%DirectusApiTokenInput.text = GeoscribeManager.userSettings.directus_token
	%OpenApiTokenInput.text = GeoscribeManager.userSettings.open_api
	%LanguageOptionSelectInput.select(GeoscribeManager.userSettings.language)
	%BasePathDir.text = GeoscribeManager.userSettings.basePath
	selected_language = GeoscribeManager.userSettings.language

func _on_save_button_pressed():
	GeoscribeManager.userSettings.directus_url = %DirectusURLInput.text
	GeoscribeManager.userSettings.directus_token = %DirectusApiTokenInput.text 
	GeoscribeManager.userSettings.open_api= %OpenApiTokenInput.text 
	GeoscribeManager.userSettings.language= selected_language 
	GeoscribeManager.userSettings.basePath = %BasePathDir.text
	GeoscribeManager.userSettings.isEmpty= false 
	GeoscribeManager.userSettings.save()
	visible = false

func _on_cancel_button_pressed():
	visible = false

func add_language_items():
	for language_label in LANGUAGE_DICTIONARY:
		%LanguageOptionSelectInput.add_item(language_label)

func _on_option_button_item_selected(index):
	selected_language = index

func _on_select_dir_button_pressed():
	%SelectDirFileDiaglog.set_current_dir(%BasePathDir.text)
	%SelectDirFileDiaglog.visible = true

func _on_select_dir_file_diaglog_dir_selected(dir):
	%BasePathDir.text = dir


func _on_select_dir_file_diaglog_canceled():
	%BasePathDir.text = GeoscribeManager.userSettings.basePath
