#language: ru

@tree

Функционал: <описание фичи>

Как Тестировщик я хочу
проверить отображение возвратов в отчете D2001 Продажи
чтобы убедиться, что отчет формируется корректно и отображает релевантные данные   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Проверка отображения возвратов в отчете D2001 Продажи

* подготовительный этап

	//Когда Загрузка данных для тестирования отчета Продажи

	И я выполняю код встроенного языка на сервере
		|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.RetailSalesReceipt.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.RetailSalesReceipt.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.RetailReturnReceipt.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	
* отображение возвратов в отчете
	И Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице 'SettingsComposerSettings' я перехожу к строке:
		| "Использование" | "Структура отчета" |
		| "Да"            | "Характеристика"   |
	И я перехожу к закладке с именем 'GroupFieldsSettings'
	И я перехожу к закладке с именем 'SelectedFieldsSettingsOff'
	И я перехожу к закладке с именем 'FilterSettingsOff'
	И я перехожу к закладке с именем 'OrderSettingsOff'
	И я перехожу к закладке с именем 'ConditionalAppearanceSettingsOff'
	И я перехожу к закладке с именем 'OutputParametersSettingsOff'
	И в таблице 'SettingsComposerSettings' я нажимаю на кнопку с именем 'SettingsComposerSettingsContextMenuUngroup'
	И в таблице 'SettingsComposerSettings' я устанавливаю флаг с именем 'SettingsComposerSettingsUse'
	И в таблице 'SettingsComposerSettings' я завершаю редактирование строки
		
	И в таблице 'SettingsComposerSettings' я перехожу к строке:
		| "Использование" | "Структура отчета" |
		| "Отчет"         | "Отчет"            |
	И я перехожу к закладке с именем 'GroupFieldsSettingsInaccessible'
	И я перехожу к закладке с именем 'SelectedFieldsSettings'
	И я перехожу к закладке с именем 'FilterSettings'
	И я перехожу к закладке с именем 'OrderSettings'
	И я перехожу к закладке с именем 'ConditionalAppearanceSettings'
	И я перехожу к закладке с именем 'OutputParametersSettings'
	И я перехожу к закладке с именем 'SelectedFieldsPage'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"                      |
		| "Да"            | "Структурное подразделение" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"        |
		| "Да"            | "Организация" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"   |
		| "Да"            | "Валюты" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"                         |
		| "Да"            | "Вид мультивалютной аналитики" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"         |
		| "Да"            | "Период, день" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"   |
		| "Да"            | "Инвойс" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"          |
		| "Да"            | "Период, месяц" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"           |
		| "Да"            | "Период, неделя" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И в таблице 'SettingsComposerSettingsSelection' я перехожу к строке:
		| "Использование" | "Поле"        |
		| "Да"            | "Период, год" |
	И в таблице 'SettingsComposerSettingsSelection' я изменяю флаг с именем 'SettingsComposerSettingsSelectionUse'
	И я нажимаю на кнопку с именем 'FormEndEdit'
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "МакетОтчетаD2001_Продажи_V1" по шаблону
	И в табличном документе "Result" ячейка с адресом "R22C4" равна "12,000"
	И в табличном документе "Result" ячейка с адресом "R22C5" равна "2 678,00"
	И в табличном документе "Result" ячейка с адресом "R22C6" равна "2 231,67"
* проверка, что помеченный на удаление возврат не отображается в отчете
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesReturn"
	И в таблице "List" я перехожу к строке
			| 'Номер' |
			| '1'     |
	И в таблице 'List' я нажимаю на кнопку с именем 'ListContextMenuUndoPosting'
	Когда В панели открытых я выбираю "D2001 Продажи"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "МакетОтчетаD2001_Продажи_V2" по шаблону
	И в табличном документе "Result" ячейка с адресом "R20C4" равна "13,000"
	И в табличном документе "Result" ячейка с адресом "R20C5" равна "2 868,00"
	И в табличном документе "Result" ячейка с адресом "R20C6" равна "2 390,00"

			
				


		
		
	


