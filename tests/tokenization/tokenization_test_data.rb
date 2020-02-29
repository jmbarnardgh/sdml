BUSINESS_REQUIREMENT_TEST_DATA = {
  :single_line_good => "#BR(FooBar)[foo][bar][have someone named foo do bar]",
  :multiline_good => "" "#BR(Hold the Line)[defensive lineman][squat 1000 lb][push any opposing offensive tackle away from the quarterback]
#BR(Run Fast)[quarterback][run fast][avoid getting sacked]
#BR(Throw Ball)[quarterback][throw the ball fast][avoid the opposing team intercepting the ball]" "",
  :multiline_with_linebreaks_good => "" "
#BR(Hold the Line)[defensive lineman][squat 1000 lb][push any opposing offensive tackle away from the quarterback]

#BR(Run Fast)[quarterback][run fast][avoid getting sacked]

#BR(Throw Ball)[quarterback][throw the ball fast][avoid the opposing team intercepting the ball]" "",
  :multiline_with_linebreaks_bad => "" "
#BR[defensive lineman][squat 1000 lb][push any opposing offensive tackle away from the quarterback]

#BR(Run Fast)[quarterback][run fast][avoid getting sacked]

#BR(Throw Ball)[quarterback][throw the ball fast][avoid the opposing team intercepting the ball]" "",
}

TECHNICAL_SPECIFICATION_TEST_DATA = {
  :single_line_good => "#TS(TechFoo)[tech][shall][be 20px high and 30px wide]",
  :single_line_good_with_neg_imp => "#TS(TechFoo)[tech][shall not][be 20px high and 30px wide]",
}

MULTIPLE_KINDS_TEST_DATA = {
  :good_br_and_good_ts => "" "#TS(TechFoo)[tech][shall][be 20px high and 30px wide]
#BR(Throw Ball)[quarterback][throw the ball fast][avoid the opposing team intercepting the ball]" "",
}

BUSINESS_CONSTRAINT_TEST_DATA = {
  :single_line_good => "#BC(FooBar)[foo][bar][30][because because because]",
}
