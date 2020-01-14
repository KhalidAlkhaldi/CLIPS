
;***************************
;* Khalid Alkhaldi *



(defrule welcome  ; a rule to handle the customer name and shows a welcome message
 
 =>
   (printout t crlf "Welcome, please enter your name: " crlf crlf)
   (bind ?nam (read)); binding the input value to name
   (assert (name ?nam)) ; Asserting the user name in the fact list
   (printout t crlf " Hey, "?nam "!" crlf ))
 

(defrule questions ; a rule to handle to primary question
    
=>

; display a message for the user
(printout t crlf " Please choose one of the following options: " crlf)
(printout t crlf "* What is the status of the restaurant? " crlf)
(printout t crlf " 1 - Full " crlf " 2 - Few" crlf " 3 - Plenty " crlf crlf)
(bind ?x (read)); binding the input value to x

(while (neq ?x 1 2 3 ) ; while function to handle any misleading input out of the options showed above
(printout t crlf "Please Answer with one of the options with a number" crlf )
(printout t crlf " 1 - Full " crlf " 2 - Few" crlf " 3 - Plenty " crlf crlf)
(bind ?x (read))) ; binding the input value to x

; if statements to declare which input the user entered matches the options above in order to excute the right function

(if (eq ?x 1)
   then
   (assert (restaurant-is Full))); asserting a fact about the resturant status
 
 (if (eq ?x 2)
  then
 (assert (restaurant-is Few)) ; asserting a fact about the resturant status
 (printout t crlf " I advice you to Leave " crlf crlf ))
 
 (if (eq ?x 3)
 then
 (assert (restaurant-is Plenty)) ; asserting a fact about the resturant status
 (printout t crlf " Please wait to be seated.. " crlf)))
 
(defrule full (restaurant-is Full) ; this rule only exuctuable if the the restaurant is FULL
=>

; display the question
(printout t crlf "* Are you hungry? " crlf)
(printout t crlf " 1- Yes" crlf " 2- No" crlf)
(bind ?x (read)) ; binding the input value to z

(while (neq ?x 1 2) ; while function to handle any misleading input out of the options showed above
(printout t crlf "Please Answer with one of the options with a number" crlf )
(printout t crlf " * Are you hungry? " crlf)
(printout t crlf " 1- Yes" crlf " 2- No" crlf)
(bind ?x (read))) ; binding the input value to x

; if statements to declare which input the user entered matches the options above in order to excute the right function

(if (eq ?x 1)
then
(assert (customer-is hungry))) ; asserting a new fact customer-is hungry

(if (eq ?x 2) ; if the customer is not hungrey then assert customer is not hungry as a fact and display respond message
then
(assert (customer-is not-hungry))
(printout t crlf " You came to the wrong place if you are not, I would advice you to leave" crlf)))

(defrule hungry (customer-is hungry) ; this rule only exuctuable if the customer is hungry
=>

; Display the question and options
(printout t crlf "* What type of food you like to eat today? " crlf)
(printout t " 1- Greek " crlf)
(printout t " 2- Italian " crlf)
(printout t " 3- Indian " crlf)
(printout t " 4- Fast Food " crlf)
(bind ?x (read)) ; binding the input to x

(while (neq ?x 1 2 3 4 ) ; while function to handle any missleading input out of the options showed above
(printout t crlf "Please Answer with one of the options with a number" crlf )
  (printout t crlf "* What type of food you like to eat today? " crlf)
   (printout t " 1- Greek " crlf)
   (printout t " 2- Italian " crlf)
   (printout t " 3- Indian " crlf)
   (printout t " 4- Fast Food " crlf)
(bind ?x (read))) ; binding the input to x

; if statements to declare which input the user entered matches the options above in order to excute the right function

(if(eq ?x 1)
    then
    (assert(food Greek))) ; assert food Greek in the fact index
  
(if(eq ?x 2)
then
   (assert(food Italian))) ; assert food Italian in the fact index

(if(eq ?x 3)
then
   (assert(food Indian))) ; assert food Indian in the fact index

(if(eq ?x 4)
then
  (assert(food Fast food)))) ; assert food Italian in the fact index


(defrule indianfood (food Indian) ; this rule only exuctuable if the the choose indian food
=>

(printout t crlf "* is it Friday today? " crlf )
(printout t crlf " 1- Yes" crlf " 2- No" crlf)
(bind ?x (read)) ; binding the input to x

(while (neq ?x 1 2) ; while function to handle any missleading input out of the options showed above
(printout t crlf "Please Answer with one of the options with a number" crlf )
(printout t crlf "* is it Friday today? " crlf )
(printout t crlf " 1- Yes" crlf " 2- No" crlf)
(bind ?x (read))) ;binding the input to x

(if(eq ?x 1)
then
(printout t crlf " Please wait... " crlf ))


(if(eq ?x 2)
then
(printout t crlf " Leave " crlf )))


(defrule italianfood (food Italian) ; this rule only exuctuable if the the choose italian food

    =>
    (printout t crlf "I just checked with the kitchen and I'm afraid that we don't serve italian food today.." crlf  "Sorry for any inconvenience " crlf ))


(defrule greekfood (food Greek) ; this rule only exuctuable if the the choose Greek food

      =>
        (printout t crlf " Please wait to be seated..  " crlf ))

(defrule Fast-food (food Fast food) ; this rule only exuctuable if the the choose fast food

=>
  (printout t crlf " Please wait to be seated..  " crlf ))

(defrule feedback
=>

(printout t crlf "* Please rate your experience with the system " crlf)
(printout t crlf " 1- Very Unsatisfied" crlf)
(printout t " 2- Unsatisfied" crlf)
(printout t " 3- Neutral" crlf)
(printout t " 4- Satisfied" crlf)
(printout t " 5- Very Satisdied" crlf crlf)
(bind ?x (read))

(while (neq ?x 1 2 3 4 5 )
(printout t crlf "! Please Answer with one of the options with a number" crlf )
(printout t crlf  "* Please rate your experience with the system " crlf)
(printout t crlf " 1- Very Unsatisfied" crlf)
(printout t " 2- Unsatisfied" crlf)
(printout t " 3- Neutral" crlf)
(printout t " 4- Satisfied" crlf)
(printout t " 5- Very Satisdied" crlf crlf)
(bind ?x (read)))

(if(eq ?x 1)
then
(assert(Feedback Very Unsatisfied)))


(if(eq ?x 2)
then
(assert (Feedback Unsatisfied)))


(if(eq ?x 3)
then
(assert (Feedback Neutral)))


(if(eq ?x 4)
then
(assert (Feedback Satisfied)))


(if(eq ?x 5)
then
(assert (Feedback Very Satisfied)))

=>
(printout t crlf crlf " ************************************************** " crlf crlf )
(printout t crlf " Thanks for using our expert system .. your feedback is appreciated! " crlf )
(printout t crlf " See you again.. Good bye!" crlf crlf))

