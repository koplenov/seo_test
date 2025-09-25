= $mol_button

**;;$mol_button;;** − модуль с кнопками.

=== Вариации:
- ;;$mol_button_major;; − кнопка с призывом к действию, имеет акцентный, привлекающий внимание, цвет
- ;;$mol_button_minor;; − обычная  кнопка без фона
- ;;$mol_button_copy;; − кнопка, копирующая в буфер обмена значение из свойства --text--.
- ;;$mol_button_download;; − кнопка, скачивающая файл из значения свойства --uri-- или --blob--
- ;;$mol_button_open;; − кнопка для открытия одного или нескольких файлов
- ;;$mol_button_share;; − кнопка, чтобы делиться ссылками и файлами

=== Примеры использования:
===== **Акцентная кнопка:**
" 	<= My_button $mol_button_major
" 		title \Нажми на меня

""Обычная кнопка\https://mol-handbook.github.io/demo/#scene=demo_mol_button_major""

===== **Выключенная кнопка:**
" 	<= My_button $mol_button_major
" 		enabled false
" 		title \Не можешь на меня нажать?

""Выключенная кнопка\https://mol-handbook.github.io/demo/#scene=demo_mol_button_major_disabled""

===== **Обработка нажатий:**
" **/my/button/button.view.tree**
" 	<= My_button $mol_button_major
" 		click? <=> click_action? null
" 		title \Нажми на меня

" **/my/button/button.view.tree.ts**
" 	click_action(next?: Event) {
" 		alert("Вот ты и нажал на меня");
" 	}

""Пример alert'a\https://mol-handbook.github.io/demo/#scene=demo_mol_button_major_click""

===== **Обычная кнопка:**
" 	<= My_button $mol_button_minor
" 		title \Нажми на меня

""Обычная кнопка\https://mol-handbook.github.io/demo/#scene=demo_mol_button_minor""

===== **Кнопка с иконкой:**
" 	<= My_button $mol_button_minor
" 		sub /
" 			<= Icon_plus $mol_icon_plus
" 			<= title

""Кнопка с иконкой\https://mol-handbook.github.io/demo/#scene=demo_mol_button_with_icon""

===== **Кнопка, где только иконка:**
" 	<= My_button $mol_button_minor
" 		sub /
" 			<= Icon_plus $mol_icon_plus

""Кнопка с только иконкой\https://mol-handbook.github.io/demo/#scene=demo_mol_button_only_icon""

===== **Кнопка для копирования:**
" 	<= My_button $mol_button_copy
" 		title \Скопировать "$mol"
" 		text \$mol

" ⚠️ **Обратите внимание**!
" При локальной разработке, открывать страницу с этой кнопкой необходимо на адресе ;;http://localhost:9080;;, иначе при нажатии на кнопку будет возникать ошибка.
" При развертывании странички на сервере, сайт должен открываться по HTTPS.
" Это необходимо в целях безопасности, \\подробнее здесь\https://web.dev/articles/async-clipboard\\.

""Кнопка копирующая текст\https://mol-handbook.github.io/demo/#scene=demo_mol_button_copy""

===== **Кнопка для скачивания:**
" 	<= My_button $mol_button_download
" 		title \Скачать изображение $mol-хендбука
" 		uri \https://i.imgur.com/4mnKAas.jpeg
" 		file_name \$mol-handbook.jpeg

" ⚠️ **Обратите внимание**!
" Атрибут --;;download;;-- у тега ;;<a>;; не работает, если сайт и изображения находятся на разных доменах. И если так, то при нажатии на кнопку изображение просто будет открываться.
" Чтобы скачивать изображения с других доменов, необходимо переопределить свойство --;;blob;;--:
" " **/my/button/button.view.tree.ts**
" " 	<= My_button $mol_button_download
" " 		title \Скачать изображение $mol-хендбука
" " 		blob <= image_blob $mol_blob
" " 		file_name \$mol-handbook.jpeg
" 
" " **/my/button/button.view.tree.ts**
" " 	@ $mol_mem
" " 	image_blob() {
" " 		return $mol_fetch.blob('https://i.imgur.com/4mnKAas.jpeg');
" " 	}

""Кнопка загрузки файлов\https://mol-handbook.github.io/demo/#scene=demo_mol_button_download""

===== **Кнопка для открытия файлов:**
" 	<= My_button $mol_button_open
" 		multiple true

""Кнопка шаринга\https://mol-handbook.github.io/demo/#scene=demo_mol_button_open""

===== **Кнопка, чтобы поделиться ссылкой:**
" 	<= My_button $mol_button_share
" 	 	title \Поделиться хендбуком
" 		uri \https://page.hyoo.ru/#!=egnum3_mpctj5
" 		capture null

""Кнопка..\https://mol-handbook.github.io/demo/#scene=demo_mol_button_share_link""

===== **Кнопка, чтобы поделиться скриншотом страницы:**
" 	<= My_button $mol_button_share
" 	 	title \Поделиться скриншотом страницы

""Кнопка..\https://mol-handbook.github.io/demo/#scene=demo_mol_button_share_screenshot""

=== Настраиваемые свойства:
- ;;enabled(): boolean;; − может ли кнопка быть нажатой (по умолчанию - ;;true;;)
- --;;click(next?: Event);;-- − метод, который вызывается при нажатии на кнопку

=== Исходный код:
" 👉 \\$mol_button\https://github.com/hyoo-ru/mam_mol/tree/master/button\\
--

\\Current Original on $hyoo_page.\https://page.hyoo.ru/#!=m33cr6_mebx7u\\