class FormValidations::Posts2Controller < ApplicationController
#   def index
    
#   end

#     def update
#       @post2.assign_attributes(posts2_params)
#       @post2.valid?
#       respond_to do |format|
#         format.text do
#           render partial: "posts2/form", locals: { post2: @post2 }, formats: [:html]
#         end
#       end
#     end

#     def create
#       @post2 = Post2.new(posts2_params)
#        @post2.validate
#         respond_to do |format|
#           format.text do
#             render partial: "posts2/form", locals: { post2: @post2 }, formats: [:html]
#         end
#       end
#     end

#    private
#     def posts2_params
#         params.require(:post2).permit(:body,:title)
#     end
end




