extends Node
class_name Effect

var duration: float = 5.0
var tick_interval: float = 1.0
var elapsed: float = 0.0
var target: Node = null

func _ready():
    start()

func start():
    if tick_interval > 0:
        _on_tick()
        var timer = Timer.new()
        timer.wait_time = tick_interval
        timer.one_shot = false
        timer.connect("timeout", _on_tick, CONNECT_DEFERRED)
        add_child(timer)
        timer.start()

    await get_tree().create_timer(duration).timeout
    queue_free()

func _on_tick():
    pass # to be overridden