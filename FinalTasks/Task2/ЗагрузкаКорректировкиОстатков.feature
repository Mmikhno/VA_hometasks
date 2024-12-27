﻿#language: ru
@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: загрузка корректировок остатков

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Загрузка корректировок остатков

	И я проверяю или создаю для документа "ОперацияПоУчетуТоваров" объекты:
		| 'Ссылка'                                                                          | 'ПометкаУдаления' | 'Номер'     | 'Дата'               | 'Проведен' | 'СодержаниеОперации'                                                      | 'Организация'                                                            |
		| 'e1cib/data/Документ.ОперацияПоУчетуТоваров?ref=8ca7000d8843cd1b11dc99ca10d37aab' | 'False'           | '000000001' | '28.08.2022 1:42:04' | 'False'    | 'Корректировка количества товара на складе по результатам инвентаризации' | 'e1cib/data/Справочник.Организации?ref=8d34000d8843cd1b11dd2bea12f94c63' |

