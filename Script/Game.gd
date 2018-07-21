extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var life=0

var curPageScript=preload("page_0.gd")

var curPage

func resetLife():
	$LifePoint.text=str(life)

func resetPage():
	$Text.text=curPage.text
	$Rep0.text=curPage.rep0
	$Rep1.text=curPage.rep1
	$Rep2.text=curPage.rep2
	$Rep3.text=curPage.rep3

func _ready():
	curPage=curPageScript.new()

	resetLife()

	resetPage()

	# Called every time the node is added to the scene.
	# Initialization here
	pass

func loadPage(var num):
	curPageScript=load("res://Script/page_"+str(num)+".gd")
	curPage=curPageScript.new()
	resetPage()

func nextPage(var addLife, var num):
	if num==1:
		life=0
		loadPage(1)
	else:
		life+=addLife
		if life>5:
			life=5
			loadPage(num)
		elif life>0:
			loadPage(num)
		else:
			loadPage(1)

	resetLife()

func _process(delta):
	if Input.is_action_just_pressed("rep0"):
		nextPage(curPage.val0, curPage.next0)

	if Input.is_action_just_pressed("rep1"):
		nextPage(curPage.val1, curPage.next1)

	if Input.is_action_just_pressed("rep2"):
		nextPage(curPage.val2, curPage.next2)

	if Input.is_action_just_pressed("rep3"):
		if curPage.next3==-1:
			get_tree().quit()
		else:
			nextPage(curPage.val3, curPage.next3)

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	pass
