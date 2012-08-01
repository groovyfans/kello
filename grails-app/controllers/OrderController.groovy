class OrderController {
    
    def index = { redirect(action:add,params:params) }

    def add = {
        def orderInstance = new Order()
        orderInstance.properties = params
        return ['orderInstance':orderInstance]
    }

    def save = {
        def orderInstance = new Order(params)
		orderInstance.orderDate = new Date()
		orderInstance.status = "NEW"

        if(!orderInstance.hasErrors() && orderInstance.save()) {
            flash.message = "order.created"
            flash.args = ["${orderInstance.id}"]
            flash.defaultMessage = "Order ${orderInstance.id} created"
            render(view:'success',model:[orderInstance:orderInstance])
        }
        else {
            render(view:'add',model:[orderInstance:orderInstance])
        }
    }

}