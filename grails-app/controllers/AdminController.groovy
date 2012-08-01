import javax.servlet.http.HttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.beans.propertyeditors.LocaleEditor
import org.springframework.security.context.SecurityContextHolder as SCH
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class AdminController {
	def authenticateService

	def beforeInterceptor = {
		def defaultLocale = 'zh_CN'
		def localeResolver = RCU.getLocaleResolver(request)
		def localeEditor = new LocaleEditor()
		localeEditor.setAsText defaultLocale
		localeResolver?.setLocale request, response, localeEditor.value
		params['lang'] = defaultLocale
		session.lang = defaultLocale
	}

	def index = { 
		
	}
	
    def products = {
        if(!params.max) params.max = 10
        [ productInstanceList: Product.list( params ) ]
    }

    def viewProduct = {
        def productInstance = Product.get( params.id )

        if(!productInstance) {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action:products)
        }
        else { return [ productInstance : productInstance ] }
    }

    def removeProduct = {
        def productInstance = Product.get( params.id )
        if(productInstance) {
            productInstance.delete()
            flash.message = "product.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Product ${params.id} deleted"
            redirect(action:products)
        }
        else {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action:products)
        }
    }

    def editProduct = {
        def productInstance = Product.get( params.id )

        if(!productInstance) {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action:products)
        }
        else {
            return [ productInstance : productInstance ]
        }
    }

    def updateProduct = {
        def productInstance = Product.get( params.id )
		productInstance.lastModifiedByUserLogin = authenticateService.principal().username
        if(productInstance) {
            productInstance.properties = params
			if(!productInstance.hasErrors() && productInstance.save()) {
				flash.message = "product.updated"
				flash.args = [params.id]
				flash.defaultMessage = "Product ${params.id} updated"
				redirect(action:viewProduct,id:productInstance.id)
			}
			else {
				render(view:'editProduct',model:[productInstance:productInstance])
			}

        }
        else {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action:editProduct,id:params.id)
        }
    }

    def createProduct = {
        def productInstance = new Product()
        productInstance.properties = params
        return ['productInstance':productInstance]
    }

    def saveProduct = {
        def productInstance = new Product(params)
		productInstance.createdByUserLogin = authenticateService.principal().username
		productInstance.lastModifiedByUserLogin = SCH.context?.authentication.getPrincipal().username
		if(!productInstance.hasErrors() && productInstance.save()) {

			flash.message = "product.created"
			flash.args = ["${productInstance.id}"]
			flash.defaultMessage = "Product ${productInstance.id} created"
			redirect(action:viewProduct,id:productInstance.id)
		}
		else {
			render(view:'createProduct',model:[productInstance:productInstance])
		}
    }

    def categories = {
        if(!params.max) params.max = 10
        [ productCategoryInstanceList: ProductCategory.list( params ) ]
    }

    def viewCategory = {
        def productCategoryInstance = ProductCategory.get( params.id )

        if(!productCategoryInstance) {
            flash.message = "productCategory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductCategory not found with id ${params.id}"
            redirect(action:productCategorys)
        }
        else { return [ productCategoryInstance : productCategoryInstance ] }
    }

    def removeCategory = {
        def productCategoryInstance = ProductCategory.get( params.id )
        if(productCategoryInstance) {
            productCategoryInstance.delete()
            flash.message = "productCategory.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "ProductCategory ${params.id} deleted"
            redirect(action:categories)
        }
        else {
            flash.message = "productCategory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductCategory not found with id ${params.id}"
            redirect(action:categories)
        }
    }

    def editCategory = {
        def productCategoryInstance = ProductCategory.get( params.id )

        if(!productCategoryInstance) {
            flash.message = "productCategory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductCategory not found with id ${params.id}"
            redirect(action:categories)
        }
        else {
            return [ productCategoryInstance : productCategoryInstance ]
        }
    }

    def updateCategory = {
        def productCategoryInstance = ProductCategory.get( params.id )

        if(productCategoryInstance) {
            productCategoryInstance.properties = params
			if(!productCategoryInstance.hasErrors() && productCategoryInstance.save()) {
				flash.message = "productCategory.updated"
				flash.args = [params.id]
				flash.defaultMessage = "ProductCategory ${params.id} updated"
				redirect(action:viewCategory,id:productCategoryInstance.id)
			}
			else {
				render(view:'editCategory',model:[productCategoryInstance:productCategoryInstance])
			}
			
        }
        else {
            flash.message = "productCategory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductCategory not found with id ${params.id}"
            redirect(action:editCategory,id:params.id)
        }
    }

    def addCategory = {
        def productCategoryInstance = new ProductCategory()
        productCategoryInstance.properties = params
        return ['productCategoryInstance':productCategoryInstance]
    }

    def saveCategory = {
        def productCategoryInstance = new ProductCategory(params)

		if(!productCategoryInstance.hasErrors() && productCategoryInstance.save()) {	
			flash.message = "productCategory.created"
			flash.args = ["${productCategoryInstance.id}"]
			flash.defaultMessage = "ProductCategory ${productCategoryInstance.id} created"
			redirect(action:viewCategory,id:productCategoryInstance.id)
		}
		else {
			render(view:'addCategory',model:[productCategoryInstance:productCategoryInstance])
		}
    }

    def orders = {
        if(!params.max) params.max = 10
        [ orderInstanceList: Order.list( params ) ]
    }

    def viewOrder = {
        def orderInstance = Order.get( params.id )

        if(!orderInstance) {
            flash.message = "order.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Order not found with id ${params.id}"
            redirect(action:orders)
        }
        else { return [ orderInstance : orderInstance ] }
    }

    def removeOrder = {
        def orderInstance = Order.get( params.id )
        if(orderInstance) {
            orderInstance.delete()
            flash.message = "order.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Order ${params.id} deleted"
            redirect(action:orders)
        }
        else {
            flash.message = "order.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Order not found with id ${params.id}"
            redirect(action:orders)
        }
    }

    def editOrder = {
        def orderInstance = Order.get( params.id )

        if(!orderInstance) {
            flash.message = "order.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Order not found with id ${params.id}"
            redirect(action:orders)
        }
        else {
            return [ orderInstance : orderInstance ]
        }
    }

    def handleOrder = {
        def orderInstance = Order.get( params.id )
        if(orderInstance) {
            orderInstance.properties = params
			orderInstance.status = "CPL"
			orderInstance.entryDate = new Date()
			orderInstance.handleUser = authenticateService.principal().username
            if(!orderInstance.hasErrors() && orderInstance.save()) {
                flash.message = "order.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Order ${params.id} updated"
                redirect(action:viewOrder,id:orderInstance.id)
            }
            else {
                render(view:'editOrder',model:[orderInstance:orderInstance])
            }
        }
        else {
            flash.message = "order.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Order not found with id ${params.id}"
            redirect(action:editOrder,id:params.id)
        }
    }

    def addOrder = {
        def orderInstance = new Order()
        orderInstance.properties = params
        return ['orderInstance':orderInstance]
    }

    def saveOrder = {
        def orderInstance = new Order(params)
        if(!orderInstance.hasErrors() && orderInstance.save()) {
            flash.message = "order.created"
            flash.args = ["${orderInstance.id}"]
            flash.defaultMessage = "Order ${orderInstance.id} created"
            redirect(action:viewOrder,id:orderInstance.id)
        }
        else {
            render(view:'addOrder',model:[orderInstance:orderInstance])
        }
    }

    def attachments = {
        if(!params.max) params.max = 10
        [ attachmentInstanceList: Attachment.list( params ) ]
    }

    def download = {
		
    }

	def selectImage = {
        if(!params.max) params.max = 10
        [ attachmentInstanceList: Attachment.list( params )]
	}

    private void addImage(imageFile) { 
		def attachment = new Attachment()
		attachment.fileName = imageFile.originalFilename
		attachment.fileSize = imageFile.size
		attachment.contentType = imageFile.contentType
		attachment.author = authenticateService.principal().username
		attachment.createdDate = new Date()
		attachment.save()
		if (imageFile.originalFilename) {
			String uploadDir = servletContext.getRealPath("/") + File.separator + "upload"
			imageFile.transferTo(new File(uploadDir + File.separator + imageFile.originalFilename))
			log.info('add image file: ' + imageFile.originalFilename)
		}
    }

    def saveAttachment = {
		def attachmentInstance = new Attachment()
		if (request instanceof MultipartHttpServletRequest) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("uploadFile")
			attachmentInstance.fileName = file.originalFilename
			attachmentInstance.fileSize = file.size
			attachmentInstance.contentType = file.contentType
			attachmentInstance.author = authenticateService.principal().username
			attachmentInstance.createdDate = new Date()
	        if(!attachmentInstance.hasErrors() && attachmentInstance.save()) {
				String uploadDir = servletContext.getRealPath("/") + File.separator + "upload"
				file.transferTo(new File(uploadDir + File.separator + file.originalFilename))
	            flash.message = "attachment.created"
	            flash.args = ["${attachmentInstance.id}"]
	            flash.defaultMessage = "Attachment ${attachmentInstance.id} created"
	            redirect(action:attachments)
	        }
	        else {
	            render(view:'attachments',model:[attachmentInstance:attachmentInstance])
	        }
		}
    }

    def removeAttachment = {
        def attachmentInstance = Attachment.get( params.id )
        if(attachmentInstance) {
            String uploadDir = servletContext.getRealPath("/") + File.separator + "upload"
            def imageFile = new File(uploadDir + File.separator + attachmentInstance.fileName)
            imageFile.delete()
            attachmentInstance.delete()
            flash.message = "attachment.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Attachment ${params.id} deleted"
            redirect(action:attachments)
        }
        else {
            flash.message = "attachment.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Attachment not found with id ${params.id}"
            redirect(action:attachments)
        }
    }

    def news = {
        if(!params.max) params.max = 10
        [ newsInstanceList: News.list( params ) ]
    }

    def viewNews = {
        def newsInstance = News.get( params.id )

        if(!newsInstance) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action:news)
        }
        else { return [ newsInstance : newsInstance ] }
    }

    def removeNews = {
        def newsInstance = News.get( params.id )
        if(newsInstance) {
            newsInstance.delete()
            flash.message = "news.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "News ${params.id} deleted"
            redirect(action:news)
        }
        else {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action:news)
        }
    }

    def editNews = {
        def newsInstance = News.get( params.id )

        if(!newsInstance) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action:news)
        }
        else {
            return [ newsInstance : newsInstance ]
        }
    }

    def updateNews = {
        def newsInstance = News.get( params.id )
		newsInstance.lastModifiedDate = new Date()
		newsInstance.lastModifiedByUserLogin = authenticateService.principal().username
        if(newsInstance) {
            newsInstance.properties = params
            if(!newsInstance.hasErrors() && newsInstance.save()) {
                flash.message = "news.updated"
                flash.args = [params.id]
                flash.defaultMessage = "News ${params.id} updated"
                redirect(action:viewNews,id:newsInstance.id)
            }
            else {
                render(view:'editNews',model:[newsInstance:newsInstance])
            }
        }
        else {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action:editNews,id:params.id)
        }
    }

    def addNews = {
        def newsInstance = new News()
        newsInstance.properties = params
		newsInstance.isNew = true
        return ['newsInstance':newsInstance]
    }

    def saveNews = {
        def newsInstance = new News(params)
		newsInstance.createdDate = new Date()
		newsInstance.createdByUserLogin = authenticateService.principal().username
		newsInstance.lastModifiedDate = new Date()
		newsInstance.lastModifiedByUserLogin = authenticateService.principal().username
        if(!newsInstance.hasErrors() && newsInstance.save()) {
            flash.message = "news.created"
            flash.args = ["${newsInstance.id}"]
            flash.defaultMessage = "News ${newsInstance.id} created"
            redirect(action:viewNews,id:newsInstance.id)
        }
        else {
            render(view:'addNews',model:[newsInstance:newsInstance])
        }
    }

	def currentNews = {
	}

	def saveCurrentNews = {
		def scn = Setting.findByCode('news.currentNews')
		if(scn) {
			scn.value = params.currentNews
			scn.lastUpdated = new Date()
		}
		else {
			scn = new Setting()
			scn.code = 'news.currentNews'
			scn.type = 'string'
			scn.value = params.currentNews
			scn.dateCreated = new Date()
			scn.lastUpdated = new Date()
		}
		scn.save()
		Setting.resetThis(scn.code)

		flash.message = "news.current.updated"
		render(view:'currentNews')
	}

    def messages = {
        if(!params.max) params.max = 10
        [ guestBookInstanceList: GuestBook.list( params ) ]
    }

    def viewMessage = {
        def guestBookInstance = GuestBook.get( params.id )

        if(!guestBookInstance) {
            flash.message = "guestBook.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "GuestBook not found with id ${params.id}"
            redirect(action:messages)
        }
        else { return [ guestBookInstance : guestBookInstance ] }
    }

    def removeMessage = {
        def guestBookInstance = GuestBook.get( params.id )
        if(guestBookInstance) {
            guestBookInstance.delete()
            flash.message = "guestBook.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "GuestBook ${params.id} deleted"
            redirect(action:messages)
        }
        else {
            flash.message = "guestBook.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "GuestBook not found with id ${params.id}"
            redirect(action:messages)
        }
    }

    def accounts = {
        if(!params.max) params.max = 10
        [ userInstanceList: User.list( params ) ]
    }

    def viewAccount = {
        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:accounts)
        }
        else { return [ userInstance : userInstance ] }
    }

    def removeAccount = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            if (userInstance.username == authenticateService.principal().username) {
                flash.message = "user.deleted.byself"
                flash.args = [params.id]
                flash.defaultMessage = "User cann't be deleted byself"
                redirect(action:accounts)
            }
            else {
                removeRoles(userInstance)
                userInstance.delete()
                flash.message = "user.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} deleted"
                redirect(action:accounts)
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:accounts)
        }
    }

    def editAccount = {
        def userInstance = User.get( params.id )
		def role = ''
		if ("ROLE_SUPERVISOR" == getUserRole(userInstance)) {
			role = 'supervisor'
		}
		else role = 'admin'
        if(!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:accounts)
        }
        else {
            return [ userInstance : userInstance, role : role ]
        }
    }

    def updateAccount = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            userInstance.properties = params
            if(!userInstance.hasErrors() && userInstance.save()) {
            	addRoles(params.role, userInstance)
                flash.message = "user.updated"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} updated"
                redirect(action:viewAccount,id:userInstance.id)
            }
            else {
                render(view:'editAccount',model:[userInstance:userInstance])
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:editAccount,id:params.id)
        }
    }

    def createAccount = {
        def userInstance = new User()
        userInstance.properties = params
        return ['userInstance':userInstance]
    }

    def saveAccount = {
        def userInstance = new User()
		userInstance.properties = params
		userInstance.passwd = authenticateService.encodePassword(params.password)
        if(!userInstance.hasErrors() && userInstance.save()) {
			addRoles(params.role, userInstance)
            flash.message = "user.created"
            flash.args = ["${userInstance.id}"]
            flash.defaultMessage = "User ${userInstance.id} created"
            redirect(action:viewAccount,id:userInstance.id)
        }
        else {
            render(view:'createAccount',model:[userInstance:userInstance])
        }
    }

	private void addRoles(role, person) {
        def admin = Role.findByAuthority('ROLE_ADMIN')
        def supervisor = Role.findByAuthority('ROLE_SUPERVISOR')
		if (role == 'admin') {
            if (!admin.people.contains(person)) {
                if (supervisor.people.contains(person)) {
                    supervisor.removeFromPeople(person)
                }
                admin.addToPeople(person)
            }
		}
        else {
            if (!supervisor.people.contains(person)){
                if (admin.people.contains(person)) {
                    admin.removeFromPeople(person)
                }
                supervisor.addToPeople(person)
            }
        }
	}

	private void removeRoles(person) {
        def admin = Role.findByAuthority('ROLE_ADMIN')
        def supervisor = Role.findByAuthority('ROLE_SUPERVISOR')
        if (admin.people.contains(person)) {
            admin.removeFromPeople(person)
        }
        if (supervisor.people.contains(person)) {
            supervisor.removeFromPeople(person)
        }
	}

	private String getUserRole(user) {
		user.authorities.toList()[0]
	}
	
    def setPassword = {
        def userInstance = User.get( params.id )
        if(!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:accounts)
        }
        else {
            return [ userInstance : userInstance ]
        }
    }

    def savePassword = {
		def userInstance = User.get( params.id )
		if(!params.password) {
			flash.error = "user.password.blank.error"
			flash.args = [params.id]
			flash.defaultError = "Password not be null"
			render(view:'setPassword',model:[userInstance:userInstance])
		}
		else if(!(params.passwordConfirm?.equals(params.password))) {
			flash.error = "user.password.not.match"
			flash.args = [params.id]
			flash.defaultError = "Confrim password not match password"
			render(view:'setPassword',model:[userInstance:userInstance])
		}
        else if(userInstance) {
            userInstance.passwd = authenticateService.encodePassword(params.password)
            if(!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "user.setpassword.success"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} password reset"
                redirect(action:viewAccount,id:userInstance.id)
            }
            else {
                render(view:'setPassword',model:[userInstance:userInstance])
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action:setPassword,id:params.id)
        }
    }

    def changePassword = {
	}

    def updatePassword = {
		def userInstance = User.findByUsername(authenticateService.principal().username)
		if(!params.oldPassword) {
			flash.error = "user.oldPassword.blank.error"
			flash.defaultError = "Old Password not be null"
			render(view:'changePassword')
		}
		else if(!(userInstance.passwd.equals(authenticateService.encodePassword(params.oldPassword)))) {
			flash.error = "user.oldPassword.wrong.error"
			flash.defaultError = "New Password was wrong"
			render(view:'changePassword')
		}
		else if(!params.newPassword) {
			flash.error = "user.newPassword.blank.error"
			flash.defaultError = "New Password not be null"
			render(view:'changePassword')
		}
		else if(!params.confirmPassword) {
			flash.error = "user.confirmPassword.blank.error"
			flash.defaultError = "Confirm Password not be null"
			render(view:'changePassword')
		}
		else if(!(params.confirmPassword?.equals(params.newPassword))) {
			flash.error = "user.password.not.match"
			flash.defaultError = "Confrim password not match new password"
			render(view:'changePassword')
		}
		else if(userInstance) {
            userInstance.passwd = authenticateService.encodePassword(params.newPassword)
            if(!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "user.changepassword.success"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} password reset"
                redirect(action:changePassword)
            }
            else {
                render(view:'changePassword')
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(controller:'login', action:'auth')
        }
	}

	def roles = {
		if (!params.max) {
			params.max = 10
		}
		[authorityList: Role.list(params)]
	}

	def viewRole = {
		[authority: Role.get(params.id)]
	}

	def removeRole = {
		def authority = Role.get(params.id)
		if (!authority) {
			flash.message = "Role not found with id ${params.id}"
			redirect(action: roles)
			return
		}

		String oldRole = authority.authority
		def rms = Requestmap.findAllByConfigAttributeLike('%' + oldRole + '%')
		rms.each {
			it.configAttribute = it.configAttribute.replace(oldRole, '')
			it.validate()
		}
		authority.delete()
		flash.message = "Role ${params.id} deleted."
		redirect(action: roles)
	}

	def editRole = {
		def authority = Role.get(params.id)
		if (!authority) {
			flash.message = "Role not found with id ${params.id}"
			redirect(action: roles)
			return
		}

		[authority: authority]
	}

	/**
	 * Authority update action. When updating an existing authority instance, the requestmaps which contain
	 * them should also be updated.
	 */
	def updateRole = {

		def authority = Role.get(params.id)
		if (!authority) {
			flash.message = "Role not found with id ${params.id}"
			redirect(action: editRole, id: params.id)
			return
		}

		String oldRole = authority.authority
		authority.properties = params
		String role = params.authority
		authority.authority = 'ROLE_' + role.toUpperCase()
		String newRole = authority.authority
		def rms = Requestmap.findAllByConfigAttributeLike('%' + oldRole + '%')
		rms.each {
			it.configAttribute = it.configAttribute.replace(oldRole, newRole)
			it.validate()
		}
		if (authority.save()) {
			redirect(action: viewRole, id: authority.id)
		}
		else {
			render(view: 'editRole', model: [authority: authority])
		}
	}

	def createRole = {
		def authority = new Role()
		authority.authority = ''
		authority.properties = params
		[authority: authority]
	}

	/**
	 * Authority save action.
	 */
	def saveRole = {

		def authority = new Role()
		String au = params.authority
		authority.properties = params
		//here translate user's input to the required format
		authority.authority = 'ROLE_' + au.toUpperCase()
		if (authority.save()) {
			redirect(action: viewRole, id: authority.id)
		}
		else {
			render(view: 'createRole', model: [authority: authority])
		}
	}

	def system = {
		
	}

	def settings = {

	}

	def saveSettings = {
		def scn = Setting.findByCode('company.name_zh_CN')
		if(scn) {
			scn.value = params.companyName_zh_CN
			scn.lastUpdated = new Date()
		}
		else {
			scn = new Setting()
			scn.code = 'company.name_zh_CN'
			scn.type = 'string'
			scn.value = params.companyName_zh_CN
			scn.dateCreated = new Date()
			scn.lastUpdated = new Date()
		}
		scn.save()
		Setting.resetThis(scn.code)

		def sen = Setting.findByCode('company.name_en')
		if(sen) {
			sen.value = params.companyName_en
			sen.lastUpdated = new Date()
		}
		else {
			sen = new Setting()
			sen.code = 'company.name_en'
			sen.type = 'string'
			sen.value = params.companyName_en
			sen.dateCreated = new Date()
			sen.lastUpdated = new Date()
		}
		sen.save()
		Setting.resetThis(sen.code)

		def scd = Setting.findByCode('company.description_zh_CN')
		if(scd) {
			scd.value = params.companyDescription_zh_CN
			scd.lastUpdated = new Date()
		}
		else {
			scd = new Setting()
			scd.code = 'company.description_zh_CN'
			scd.type = 'string'
			scd.value = params.companyDescription_zh_CN
			scd.dateCreated = new Date()
			scd.lastUpdated = new Date()
		}
		scd.save()
		Setting.resetThis(scd.code)

		def sed = Setting.findByCode('company.description_en')
		if(sed) {
			sed.value = params.companyDescription_en
			sed.lastUpdated = new Date()
		}
		else {
			sed = new Setting()
			sed.code = 'company.description_en'
			sed.type = 'string'
			sed.value = params.companyDescription_en
			sed.dateCreated = new Date()
			sed.lastUpdated = new Date()
		}
		sed.save()
		Setting.resetThis(sed.code)

		def scc = Setting.findByCode('company.contacts_zh_CN')
		if(scc) {
			scc.value = params.companyContacts_zh_CN
			scc.lastUpdated = new Date()
		}
		else {
			scc = new Setting()
			scc.code = 'company.contacts_zh_CN'
			scc.type = 'string'
			scc.value = params.companyContacts_zh_CN
			scc.dateCreated = new Date()
			scc.lastUpdated = new Date()
		}
		scc.save()
		Setting.resetThis(scc.code)

		def sec = Setting.findByCode('company.contacts_en')
		if(sec) {
			sec.value = params.companyContacts_en
			sec.lastUpdated = new Date()
		}
		else {
			sec = new Setting()
			sec.code = 'company.contacts_en'
			sec.type = 'string'
			sec.value = params.companyContacts_en
			sec.dateCreated = new Date()
			sec.lastUpdated = new Date()
		}
		sec.save()
		Setting.resetThis(sec.code)

		def scr = Setting.findByCode('company.copyright_zh_CN')
		if(scr) {
			scr.value = params.companyCopyright_zh_CN
			scr.lastUpdated = new Date()
		}
		else {
			scr = new Setting()
			scr.code = 'company.copyright_zh_CN'
			scr.type = 'string'
			scr.value = params.companyCopyright_zh_CN
			scr.dateCreated = new Date()
			scr.lastUpdated = new Date()
		}
		scr.save()
		Setting.resetThis(scr.code)

		def ser = Setting.findByCode('company.copyright_en')
		if(ser) {
			ser.value = params.companyCopyright_en
			ser.lastUpdated = new Date()
		}
		else {
			ser = new Setting()
			ser.code = 'company.copyright_en'
			ser.type = 'string'
			ser.value = params.companyCopyright_en
			ser.dateCreated = new Date()
			ser.lastUpdated = new Date()
		}
		ser.save()
		Setting.resetThis(ser.code)
		
		flash.message = "settings.updated"
		redirect(action:settings)

	}
}
