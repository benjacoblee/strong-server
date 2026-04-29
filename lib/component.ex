defmodule Component do
  import Vaux.Component
  attr(:workout_number, :string)
  attr(:date, :string)
  attr(:workouts, :array)

  ~H"""
  <div class="bg-ctp-mantle flex h-full w-full flex-col rounded-sm px-4 py-4">
    <div class="flex w-full flex-col gap-4">
      <div class="font-bold text-2xl">Workout #{@workout_number}</div>
      <div class="font-bold">{@date}</div>
      <table class="table-auto">
        <thead>
          <tr>
            <th class="text-left">Exercise Name</th>
            <th class="text-center">Set #</th>
            <th class="text-right">Detail</th>
          </tr>
        </thead>
        <tbody>
          <tr :for={workout <- @workouts}>
            <td class="text-left">{workout.exercise_name}</td>
            <td class="text-center">{workout.set_order}</td>
            <td class="text-right">{workout.detail}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  """vaux
end
