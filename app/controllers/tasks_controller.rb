class TasksController < ApplicationController
    def index
        @tasks = Task.all #esto hace fetch todas las tasks de la db
        @task = Task.new #crea una nueva tarea
    end

    def create 
        @task = Task.new(task_params)

        respond_to do |format|
            if @task.save
                format.html { redirect_to tasks_path, notice: "Task was created" }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description) #tecnica llamada "strong parameters" permite elegir que atributos son permitidos
    end

    def toggle
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])

        render json: { message: "Success"}
    end
end
