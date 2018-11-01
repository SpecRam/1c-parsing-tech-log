// Устанавливает размер шрифта заголовков групп формы для их корректного отображения в интерфейсе 8.2.
//
// Параметры:
//  Форма - УправляемаяФорма - Форма для изменения шрифта заголовков групп;
//  ИменаГрупп - Строка - Список имен групп формы, разделенных запятыми.
//
Процедура УстановитьОтображениеЗаголовковГрупп(Форма, ИменаГрупп = "") Экспорт
	
	Если ВариантИнтерфейсаКлиентскогоПриложения= ВариантИнтерфейсаКлиентскогоПриложения.Версия8_2 Тогда
		ЖирныйШрифт = Новый Шрифт(,, Истина);
		Если НЕ ЗначениеЗаполнено(ИменаГрупп) Тогда 
			Для Каждого Элемент Из Форма.Элементы Цикл 
				Если Тип(Элемент) = Тип("ГруппаФормы")
					И Элемент.Вид = ВидГруппыФормы.ОбычнаяГруппа
					И Элемент.ОтображатьЗаголовок = Истина 
					И (Элемент.Отображение = ОтображениеОбычнойГруппы.ОбычноеВыделение
					Или Элемент.Отображение = ОтображениеОбычнойГруппы.Нет) Тогда 
						Элемент.ШрифтЗаголовка = ЖирныйШрифт;
				КонецЕсли;
			КонецЦикла;
		Иначе
			МассивЗаголовков = СтроковыеФункцииКлиентСервер.РазложитьСтрокуВМассивПодстрок(ИменаГрупп,,, Истина);
			Для Каждого ИмяЗаголовка Из МассивЗаголовков Цикл
				Элемент = Форма.Элементы[ИмяЗаголовка];
				Если Элемент.Отображение = ОтображениеОбычнойГруппы.ОбычноеВыделение ИЛИ Элемент.Отображение = ОтображениеОбычнойГруппы.Нет Тогда 
					Элемент.ШрифтЗаголовка = ЖирныйШрифт;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры
