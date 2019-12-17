# Documentation File for Word Galaxy Network

### Rohit K Bharadwaj

### 12th July 2019

## 1 Creating The Raw Corpus

Open R studio and open upword2vecVitiligo.Rfile and make sure that vitiligoabs is loaded into the
workspace as a S4 Class object. Refer to Fig 1, and Run only thehighlighted codein the figure. This
will generate the filerawcorpus.txtfile in the current working directory.


![Creating Raw Corpus](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig1.jpg)
```

Figure 1: Creating Raw Corpus
```
## 2 Data Preprocessing

Now put the file rawcorpus.txtin the same directory as the file word2vec-vitiligo.ipynb. Open
Jupyter notebook and runword2vec-vitiligo.ipynb. Execute all the cells in the jupyter notebook till
the cell shown in Fig. 2, or execute the first 19 cells in the notebook to create the tokenized corpus file.

![Final Cell to Execute](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig2.jpg)

```
Figure 2: Final Cell to be executed to create the Tokenizedcorpus.txt
```
We get a file calledtokenizedcorpus.txtafter executing all the above cells and which would be used
by the GloVe model to build the word embedding.

## 3 Installing GloVe Algorithm

Please go to the following link for reference:
https://github.com/stanfordnlp/GloVe
Type the following commands(after the $ sign) in ubuntu terminal to download GloVe and use it.

$ git clone [http://github.com/stanfordnlp/glove](http://github.com/stanfordnlp/glove)
$ cd glove && make
$ ./demo.sh

for this you should have already installedmakeandgitpackages in your ubuntu. In the Code file, I
Have just given two files in the GloVe files directory, you would have to install GloVe properly from
scratch and replace those files to replicate the results.

## 4 Changing Hyperparameters of the GloVe model

Now, there will be a folder called glove created in your current directory, just open it up and you will find
another folder called glove in it, open it and there will be a file calleddemo.sh, open it using text
editor,and you may modify the earlier code with the following code in Fig.3 which also contains the
hyper parameters used by me.

![Hyper Parameters](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig3.jpg)
```
Figure 3: GloVe Hyper parameters
```
Note that in Figure 3, the value for CORPUS is given astokenizedcorpus.txt, this will be the corpus
file which you will be using after all the pre-processing steps. This file has to be in same directory as
demo.sh file. It is also required that the words in thistokenizedcorpusare separated by single or more
space character and different documents should be starting out from new line.

## 5 Training the GloVe Model on corpus text

After editing out thedemo.shfile, just open terminal in that folder, and execute the file demo.sh by
running the following command
$ ./demo.sh
The model should train for some time depending on the set hyper-parameters, after the model is
executed it will stop and then generate a vectors.txt file which can be loaded into Python Notebook
through Gensim Python Library.

## 6 Loading the GloVe model in Jupyter Notebook

Open theGloVe-model.ipynbfile in jupyter notebook, it should open and should look something like
Fig. 4. Execute the first and the second cell present there and make sure thevectors.txtwhich is a file
generated from GloVe, is placed in the same folder whereGlove-model.ipynbis present.

![Loading model](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig4.jpg)
```
Figure 4: Loading GloVe model in Python Notebook
```
Now you can find top 10 similar words to a given word by executing the third cell in the notebook, you
can replace the word”ace”with any other word for which you want to check the similarity, The top 10
similar words along with their cosine similarity score is displayed as shown in Fig. 4.
Now execute the cells shown in Fig. 5
![Nodes and Edges](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig5.jpg)
```
Figure 5: Creating Nodes and Edges files for Gephi
```

After Executing all the 3 cells then there will be 2 files generated, one corresponding to thenodescsv
file and other corresponding toedgescsv file. These 2 files would be then imported into Gephi for the
visualization of the network.

## 7 Importing the Files into Gephi

Open up Gephi software, by executing the file gephi present in bin folder of Gephi file, you have to
download Gephi files from the internet.

Now the interface should open, click on the Data laboratory part in Gephi, and click on Import
Spreadsheet button, as shown in Fig. 6

![Importing Files](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig6.jpg)
```
Figure 6: Importing Files in Gephi
```
First import the nodes file by selecting it from the file chooser dialog box, in theimport asoption make
sure it is selected asNodes table. After that click on next and finish, in the report screen, select the
option toAppend to existing workspaceas shown in Fig. 7

![Append existing workspace](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig7.jpg)
```
Figure 7: Append to existing workspace
```
The Graph type can be selected toDirected. Click Ok. Repeat the similar process and import Edges
file this time but in theImport asoption selectEdges tablethis time and do the same process.

## 8 Analysing the network data in Gephi

As shown in Fig. 8, Click on the Overview Tab and then in the Layout algorithm selectForce Atlas 2
and hit Run. You may change the value of scaling to spread out nodes far from each other

![Using Force Atlas](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig8.jpg)
```
Figure 8: Using Force Atlas 2 Algorithm as Layout algorithm.
```
After clicking on Run, the algorithm will run for some time and you can stop the algorithm once you find
there is not much movement of nodes in the Graph,you can center the graph by clicking on the
magnifying glass icon present in the bottom left corner. Enable the labels on the node by clicking on the
Tsymbol present at the bottom.

## 9 Running Modularity Test

As shown in Fig. 9, open the statistics tab and run the modularity test. You can increase or decrease the
modularity value to get more or less communities respectively. Click OK and then wait for it to finish
and close the report.

![Modularity](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig9.jpg)
```
Figure 9: Modularity Statistical Test
```
Now open the Nodes Tab and click on Partition Tab as shown in Fig. 10 and from drop-down menu
select Modularity Class, You can change the colors by holding the left mouse button on the colors and
then click Apply to partition the nodes by their modularity class.

![Partition nodes](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig10.jpg)
```
Figure 10: Partition the Nodes by Modularity Class
```
## 10 Applying Filters to the Network

As shown in Fig. 11, open the filters tab and select Ego Network filter from the Toplogy Directory, Drag
the filter to the place under Queries and enter the Node ID for which you want to find the Ego Network
and ClickOK, to display the Ego Network.

![Ego Network](https://github.com/rohit901/Word-Galaxy-Network/blob/master/DocImages/Fig11.jpg)
```
Figure 11: Applying Ego Network to the Graph
```
There can be other Filters like only making a particular modularity class visible, for that you have to go
underAttributesDirectory and then underPartitionDirectory, drag the filter which says Modularity
Class into the queries to filter by modularity class.
The graph can be zoomed in by theScroll Wheel.

## 11 Contact

Please mail me on f20170633@pilani.bits-pilani.ac.in or bharadwaj.rohit8@gmail.com for any further queries or doubts.


