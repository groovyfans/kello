import org.springframework.validation.Errors;
import org.springframework.context.NoSuchMessageException;
import org.springframework.web.servlet.support.RequestContextUtils as RCU;
import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU;   
import org.codehaus.groovy.grails.commons.ApplicationHolder
import java.text.DecimalFormatSymbols
import java.text.DecimalFormatSymbols
import java.text.NumberFormat

class KelloTagLib {

	static namespace = "k"
	static locales = ['zh_CN', 'en']

	def authenticateService
	def kelloCommonService

	def isSupervisor = { attrs, body ->
		def user = attrs['user']
		def authorities = user.authorities
		def flag = false
		authorities.each { authority ->
			if ("ROLE_SUPERVISOR" == authority.authority)
				flag = true
		}
		if (flag)
			out << body()
	}
	def isAdmin = { attrs, body ->
		def user = attrs['user']
		def authorities = user.authorities
		def flag = false
		authorities.each { authority ->
			if ("ROLE_ADMIN" == authority.authority)
				flag = true
		}
		if (flag)
			out << body()
	}

	def settings = { attrs ->
		def lang = checkLocale(session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
		def code = attrs['code']
		def translate = attrs['translate'] == 'true'
		def defaultValue = attrs['default']
		code = translate ? code+'_'+lang : code
		def value = Setting.valueFor(code)
		if (value)
			out << value?.decodeHTML()
		else if (defaultValue) 
			out << defaultValue
	}

	def serverInfo = { attrs ->
		out << servletContext.getServerInfo()
	}

    /**
     * Obtains the value of a field either from the original errors
     *
     * eg. <k:fieldValue bean="${bean}" field="name" translate="true" decode="true"/>
     */ 
	def fieldValue = { attrs ->
		def lang = checkLocale(session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
   		def bean = attrs.bean
		def field = attrs.field
		def translate = attrs.translate == 'true'
		def decode = attrs.decode == 'true'
		def wrap = attrs.wrap ? attrs.wrap.toInteger() : -1
		if (translate && lang == 'en') field = field + 'En'
		if(bean && field) {
			if(bean.getClass().metaClass.hasProperty(bean, 'errors')) {
				def errors = bean.errors
                
                def rejectedValue = errors?.getFieldError(field)?.rejectedValue
				if(rejectedValue == null ) {
                    rejectedValue = bean?."$field"
                    
                }
				if(rejectedValue != null) {
					out << formatValue(rejectedValue, decode, wrap)
				}
			}
			else {     
				def rejectedValue = bean?."$field"
				if(rejectedValue != null) {
					out << formatValue(rejectedValue, decode, wrap)
				}
			}
		}
	}

    /**
     * Formats a given value for output to an HTML page by converting
     * it to a string and encoding it. If the value is a number, it is
     * formatted according to the current user's locale during the
     * conversion to a string. 
     */
    def formatValue(value, decode, wrap) {
        if (value instanceof Number) {
            def pattern = "0"
            if (value instanceof Double || value instanceof Float || value instanceof BigDecimal) {
                pattern = "0.00#####"
            }
            def locale = RCU.getLocale(request)
            def dcfs = locale ? new DecimalFormatSymbols(locale) : new DecimalFormatSymbols()
            def decimalFormat = new java.text.DecimalFormat(pattern, dcfs)
            value = decimalFormat.format(value)
        }
		def substr = value.toString()
		if (wrap > 0) {
			substr = value.toString().size() > wrap ? value.toString().substring(0, wrap) + '...' : value.toString()
		}
        decode ? substr.decodeHTML() : substr.encodeAsHTML()
    }

	private String checkLocale(Locale locale) {
		def lang = locale?.getLanguage()
		def result = locales.find { it == lang }
		return result ?: 'zh_CN'
	}

    def productCategories = { attrs, body -> 
        def lang = checkLocale(session['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
        def field = "name"
        if (lang == 'en') field = field + 'En'
        def categories = kelloCommonService.allProductCategories()
        categories.eachWithIndex { c,i ->
            i==0 ? out << "<li class='first'>" : out << "<li>"
            out << g.link(controller:"products", action:"index", params:[c:c.id]) {
                    c?."$field"
                }
            out << "</li>"
        }
    }
}
