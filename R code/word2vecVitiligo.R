#Displays all the common words in whole english literature
common_words_new


#Displays the most frequent occuring word in the abstract after removing the common words.
vitiligo_words = word_atomizations(vitiligoabs)
vitiligo_words

result = Give_Sentences("vitiligo",vitiligoabs)

result2 = Give_Sentences("Vitiligo",vitiligoabs) #since it is case-sensitive

result_final = c(result,result2)

#Displays all the sentences which contain the word vitiligo in the First Abstract.
result_final[1]

#to get the PMID of the abstracts.
attr(result,"PMID")[1]

#all the sentences having word vitiligo, Note we got 19k in word atomization function but this list length is around 17k, this 
#means that some of the sentences may have the word vitiigo mentioned more than once.
myresult = unlist(result_final)
bigramList = read.delim(file = "bigram_th50_unique_mincnt25.txt", sep = "\n", header = FALSE)
splitTerms = function(bigram){
        myList <- list()
        firstTerm <- c()
        secondTerm <- c()
        for (i in 1:nrow(bigram)){
                
                myList <- strsplit(as.character(bigram[i,1]), split = " ")
                firstTerm <- c(firstTerm, myList[[1]][1])
                secondTerm <- c(secondTerm, myList[[1]][2])
                
        }
        cmbList <- list(firstTerm = firstTerm, secondTerm = secondTerm)
                      
        return(cmbList)
}

firstTermBigram <- splitTerms(bigramList)$firstTerm
secondTermBigram <- splitTerms(bigramList)$secondTerm



co_occurrence_fn(terms1 = firstTermBigram, abs = vitiligoabs, filename = "bigram_th450",  terms2 = secondTermBigram)


compute_co_occur_bigram = function(bigram){
         firstTermVector <- splitTerms(bigram)$firstTerm
         secondTermVector <- splitTerms(bigram)$secondTerm
         
         for(i in 1:length(firstTermVector)){
                 
                 co_occurrence_fn(terms1 = firstTermVector[i], abs = vitiligoabs, filename = paste(firstTermVector[i], secondTermVector[i],"", sep = "_"), terms2 = secondTermVector[i])
                 
         }
         
}
print_missing_pair = function(){
        firstTermVector <- splitTerms(bigramList)$firstTerm
        secondTermVector <- splitTerms(bigramList)$secondTerm
        for(i in 1:length(splitTerms(bigramList)$firstTerm)){
                
                if(!file.exists(paste(firstTermVector[i], secondTermVector[i],"co_occurrence.txt", sep = "_"))){
                        write(paste(firstTermVector[i],secondTermVector[i]), file = "Missing_Phrases", append = TRUE)
                }
                
        }
        
        
}


myfile = readLines("Bordeaux_France_co_occurrence.txt")
mycount1 = regexpr("Bordeaux[ ,.]*France",myfile)
mycount2 = which(mycount1 != -1)
myfile = readLines("Acad_Dermatol_co_occurrence.txt")
mycount1 = regexpr("Acad[ ,.]*Dermatol",myfile)
mycount2 = which(mycount1 != -1)

compute_phrase_freq = function(){
        firstTermVector <- splitTerms(bigramList)$firstTerm
        secondTermVector <- splitTerms(bigramList)$secondTerm
        for(i in 1:length(splitTerms(bigramList)$firstTerm)){
                
                if(file.exists(paste(firstTermVector[i], secondTermVector[i],"co_occurrence.txt", sep = "_"))){
                        
                        myfile = readLines(paste(firstTermVector[i], secondTermVector[i],"co_occurrence.txt", sep = "_"))
                        mycount1 = gregexpr(paste(firstTermVector[i], "[ ,.]*", secondTermVector[i], sep = ""),myfile)
                        mycount1 = unlist(mycount1)
                        mycount2 = length(which(mycount1 != -1))
                        write(paste("Phrase:",firstTermVector[i],secondTermVector[i], ", Count:",mycount2), file = "bigram_th50_frequency_co_occur_mincnt25.txt", append = TRUE)
                        
                }
                
        }
        
}

glov_word_vec = read.csv("word_sim_nodes.csv", sep = "\t")
intersection_result = intersect(vitiligo_words$words, glov_word_vec$Label)
intr_df = data.frame(words = intersection_result, freq = freqvec2)
freqvec = c()
freqvec2 = unname(sapply(intersection_result, FUN = function(x) { vitiligo_words[which(vitiligo_words$words == x),]$Freq } ))

diff_vitabs_from_glove = as.data.frame( setdiff(vitiligo_words$words, glov_word_vec$Label) )

fileData = c()

for(ele in 1:length(vitiligoabs@Abstract)){
        
        fileData = c(fileData, gsub("[\r\n]", "", vitiligoabs@Abstract[ele]))

}
write(fileData, file = "raw_corpus.txt")

