class GrailsExtendsTagLib {
	static namespace = "gx"
	static locales = ['zh_CN', 'en']

    /**
     * Creates a image tag, that support i18n.
     *
     * eg. <gx:img src="" i18n="true" alt="" />
     */
	def img = { attrs ->
		def lang = checkLocale(session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
		def i18n = attrs['i18n'] == "true"
		def src = attrs['src']
		out << "<img src=\""
		if (i18n) {
			out << src.substring(0, src.lastIndexOf('.')) << "_${lang}" << src.substring(src.lastIndexOf('.')) 
		}
		else {
			out << src
		}
		out  << "\" alt=\"" << attrs['alt'] << "\"/>"
	}

    /**
     * Creates a image tab, and support i18n.
     *
     * eg. <gx:tab src="" i18n="true" selected="true" alt="" />
     */
	def tab = { attrs ->
		def lang = checkLocale(session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
		def src = attrs['src']
		def i18n = Boolean.valueOf(attrs['i18n'])
		def selected = Boolean.valueOf(attrs['selected'])
		out << "<img src=\"" << src.substring(0, src.lastIndexOf('.')) 
		out << (selected ? "_on" : "_off")
		out << (i18n ? "_${lang}" : "_zh_CN")
		out << src.substring(src.lastIndexOf('.')) 
		out << "\" alt=\"" << attrs['alt'] << "\"/>"
	}

	private String checkLocale(Locale locale) {
		def lang = locale?.getLanguage()
		def result = locales.find { it == lang }
		return result ?: 'zh_CN'
	}
}
