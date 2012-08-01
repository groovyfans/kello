import java.util.Properties
import org.springframework.core.io.ClassPathResource

def static propFile = "kello-config.properties"
def props = new Properties()
try {
    props.load(new ClassPathResource(propFile).inputStream)
} catch(Exception e) {
    e.printStackTrace()
}

dataSource {
    pooled = true
    driverClassName = props.getProperty("jdbc.driverClassName")
    username = props.getProperty("jdbc.username")
    password = props.getProperty("jdbc.password")
    dbCreate = "update"
    url = props.getProperty("jdbc.url")
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
