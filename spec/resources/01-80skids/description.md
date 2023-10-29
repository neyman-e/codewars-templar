<div class="markdown prose max-w-none mb-8" id="description">
<p>You and your friends have been battling it out with your Rock 'Em, Sock 'Em robots, but things have gotten a little boring. You've each decided to add some amazing new features to your robot and automate them to battle to the death.</p>
<p>Each robot will be represented by an object. You will be given two robot objects, and an object of battle tactics and how much damage they produce. Each robot will have a name, hit points, speed, and then a list of battle tactics they are to perform in order. Whichever robot has the best speed, will attack first with one battle tactic. </p>
<p>Your job is to decide who wins.</p>
<p>Example:</p>
<pre style="display: none;"><code class="language-javascript"> <span class="cm-variable">robot1</span> <span class="cm-operator">=</span> {
  <span class="cm-string cm-property">"name"</span>: <span class="cm-string">"Rocky"</span>,
  <span class="cm-string cm-property">"health"</span>: <span class="cm-number">100</span>,
  <span class="cm-string cm-property">"speed"</span>: <span class="cm-number">20</span>,
  <span class="cm-string cm-property">"tactics"</span>: [<span class="cm-string">"punch"</span>, <span class="cm-string">"punch"</span>, <span class="cm-string">"laser"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable">robot2</span> <span class="cm-operator">=</span> {
   <span class="cm-string cm-property">"name"</span>: <span class="cm-string">"Missile Bob"</span>,
   <span class="cm-string cm-property">"health"</span>: <span class="cm-number">100</span>,
   <span class="cm-string cm-property">"speed"</span>: <span class="cm-number">21</span>,
   <span class="cm-string cm-property">"tactics"</span>: [<span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable">tactics</span> <span class="cm-operator">=</span> {
   <span class="cm-string cm-property">"punch"</span>: <span class="cm-number">20</span>,
   <span class="cm-string cm-property">"laser"</span>: <span class="cm-number">30</span>,
   <span class="cm-string cm-property">"missile"</span>: <span class="cm-number">35</span>
 }
 
 <span class="cm-variable">fight</span>(<span class="cm-variable">robot1</span>, <span class="cm-variable">robot2</span>, <span class="cm-variable">tactics</span>) <span class="cm-operator">-</span><span class="cm-operator">&gt;</span> <span class="cm-string">"Missile Bob has won the fight."</span>
</code></pre>
<pre style="display: none;"><code class="language-coffeescript"><span class="cm-variable">robot1</span> <span class="cm-punctuation">=</span>
<span class="cm-indent">  </span><span class="cm-variable">name</span><span class="cm-punctuation">:</span> <span class="cm-string">"Rocky"</span>
  <span class="cm-variable">health</span><span class="cm-punctuation">:</span> <span class="cm-number">100</span>
  <span class="cm-variable">speed</span><span class="cm-punctuation">:</span> <span class="cm-number">20</span>
  <span class="cm-variable">tactics</span><span class="cm-punctuation">:</span> <span class="cm-punctuation">[</span>
    <span class="cm-string">"punch"</span><span class="cm-punctuation">,</span> <span class="cm-string">"punch"</span><span class="cm-punctuation">,</span> <span class="cm-string">"laser"</span><span class="cm-punctuation">,</span> <span class="cm-string">"missile"</span>
<span class="cm-dedent">  </span><span class="cm-punctuation">]</span>
<span class="cm-variable">robot2</span> <span class="cm-punctuation">=</span>
<span class="cm-indent">  </span><span class="cm-variable">name</span><span class="cm-punctuation">:</span> <span class="cm-string">"Missile Bob"</span>
  <span class="cm-variable">health</span><span class="cm-punctuation">:</span> <span class="cm-number">100</span>
  <span class="cm-variable">speed</span><span class="cm-punctuation">:</span> <span class="cm-number">21</span>
  <span class="cm-variable">tactics</span><span class="cm-punctuation">:</span> <span class="cm-punctuation">[</span>
    <span class="cm-string">"missile"</span><span class="cm-punctuation">,</span> <span class="cm-string">"missile"</span><span class="cm-punctuation">,</span> <span class="cm-string">"missile"</span><span class="cm-punctuation">,</span> <span class="cm-string">"missile"</span>
<span class="cm-dedent">  </span><span class="cm-punctuation">]</span>
<span class="cm-variable">tactics</span> <span class="cm-punctuation">=</span>
<span class="cm-indent">  </span><span class="cm-variable">punch</span><span class="cm-punctuation">:</span> <span class="cm-number">20</span>
  <span class="cm-variable">laser</span><span class="cm-punctuation">:</span> <span class="cm-number">30</span>
  <span class="cm-variable">missile</span><span class="cm-punctuation">:</span> <span class="cm-number">35</span>
<span class="cm-error"> </span>
<span class="cm-variable">fight</span><span class="cm-punctuation">(</span><span class="cm-variable">robot1</span><span class="cm-punctuation">,</span> <span class="cm-variable">robot2</span><span class="cm-punctuation">,</span> <span class="cm-variable">tactics</span><span class="cm-punctuation">)</span> <span class="cm-comment"># "Missile Bob has won the fight."</span>
</code></pre>
<pre><code class="language-ruby"><span class="cm-variable">robot1</span> <span class="cm-operator">=</span> {
  <span class="cm-string">"name"</span> <span class="cm-operator">=&gt;</span> <span class="cm-string">"Rocky"</span>,
  <span class="cm-string">"health"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">100</span>,
  <span class="cm-string">"speed"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">20</span>,
  <span class="cm-string">"tactics"</span> <span class="cm-operator">=&gt;</span> [<span class="cm-string">"punch"</span>, <span class="cm-string">"punch"</span>, <span class="cm-string">"laser"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable">robot2</span> <span class="cm-operator">=</span> {
   <span class="cm-string">"name"</span> <span class="cm-operator">=&gt;</span> <span class="cm-string">"Missile Bob"</span>,
   <span class="cm-string">"health"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">100</span>,
   <span class="cm-string">"speed"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">21</span>,
   <span class="cm-string">"tactics"</span> <span class="cm-operator">=&gt;</span> [<span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable">tactics</span> <span class="cm-operator">=</span> {
   <span class="cm-string">"punch"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">20</span>,
   <span class="cm-string">"laser"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">30</span>,
   <span class="cm-string">"missile"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">35</span>
 }
 
 <span class="cm-variable">fight</span>(<span class="cm-variable">robot1</span>, <span class="cm-variable">robot2</span>, <span class="cm-variable">tactics</span>) <span class="cm-comment"># "Missile Bob has won the fight."</span>
</code></pre>
<pre style="display: none;"><code class="language-java">  <span class="cm-variable">robot1</span>.<span class="cm-variable">getName</span>() <span class="cm-operator">=&gt;</span> <span class="cm-string">"Rocky"</span>
  <span class="cm-variable">robot1</span>.<span class="cm-variable">getHealth</span>() <span class="cm-operator">=&gt;</span> <span class="cm-number">100</span>
  <span class="cm-variable">robot1</span>.<span class="cm-variable">getSpeed</span>() <span class="cm-operator">=&gt;</span> <span class="cm-number">20</span>
  <span class="cm-variable">robot1</span>.<span class="cm-variable">getTactics</span>() <span class="cm-operator">=&gt;</span> [<span class="cm-string">"punch"</span>, <span class="cm-string">"punch"</span>, <span class="cm-string">"laser"</span>, <span class="cm-string">"missile"</span>]
    
  <span class="cm-variable">robot2</span>.<span class="cm-variable">getName</span>() <span class="cm-operator">=&gt;</span> <span class="cm-string">"Missile Bob"</span>
  <span class="cm-variable">robot2</span>.<span class="cm-variable">getHealth</span>() <span class="cm-operator">=&gt;</span> <span class="cm-number">100</span>
  <span class="cm-variable">robot2</span>.<span class="cm-variable">getSpeed</span>() <span class="cm-operator">=&gt;</span> <span class="cm-number">21</span>
  <span class="cm-variable">robot2</span>.<span class="cm-variable">getTactics</span>() <span class="cm-operator">=&gt;</span> [<span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>]
 
  <span class="cm-variable">tactics</span> <span class="cm-operator">=</span> {
    <span class="cm-string">"punch"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">20</span>,
    <span class="cm-string">"laser"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">30</span>,
    <span class="cm-string">"missile"</span> <span class="cm-operator">=&gt;</span> <span class="cm-number">35</span>
  }
 
 <span class="cm-variable">fight</span>(<span class="cm-variable">Robot</span> <span class="cm-variable">robot1</span>, <span class="cm-variable">Robot</span> <span class="cm-variable">robot2</span>, <span class="cm-variable">Map</span><span class="cm-operator">&lt;</span><span class="cm-type">String</span>, <span class="cm-type">Integer</span><span class="cm-operator">&gt;</span> <span class="cm-variable">tactics</span>) <span class="cm-operator">-&gt;</span> <span class="cm-string">"Missile Bob has won the fight."</span>
</code></pre>
<pre style="display: none;"><code class="language-python"> <span class="cm-variable">robot_1</span> <span class="cm-operator">=</span> {
  <span class="cm-string">"name"</span>: <span class="cm-string">"Rocky"</span>,
  <span class="cm-string">"health"</span>: <span class="cm-number">100</span>,
  <span class="cm-string">"speed"</span>: <span class="cm-number">20</span>,
  <span class="cm-string">"tactics"</span>: [<span class="cm-string">"punch"</span>, <span class="cm-string">"punch"</span>, <span class="cm-string">"laser"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable cm-error">robot_2</span> <span class="cm-operator">=</span> {
   <span class="cm-string">"name"</span>: <span class="cm-string">"Missile Bob"</span>,
   <span class="cm-string">"health"</span>: <span class="cm-number">100</span>,
   <span class="cm-string">"speed"</span>: <span class="cm-number">21</span>,
   <span class="cm-string">"tactics"</span>: [<span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>, <span class="cm-string">"missile"</span>]
 }
 <span class="cm-variable">tactics</span> <span class="cm-operator">=</span> {
   <span class="cm-string">"punch"</span>: <span class="cm-number">20</span>,
   <span class="cm-string">"laser"</span>: <span class="cm-number">30</span>,
   <span class="cm-string">"missile"</span>: <span class="cm-number">35</span>
 }
 
<span class="cm-null cm-error"> </span><span class="cm-variable">fight</span>(<span class="cm-variable">robot_1</span>, <span class="cm-variable">robot_2</span>, <span class="cm-variable">tactics</span>) <span class="cm-operator">-</span><span class="cm-operator">&gt;</span> <span class="cm-string">"Missile Bob has won the fight."</span>
</code></pre>
<p>robot2 uses the first tactic, "missile" because he has the most speed. This reduces robot1's health by 35. Now robot1 uses a punch, and so on. </p>
<p><strong>Rules</strong></p>
<ul>
<li>A robot with the most speed attacks first. If they are tied, the first robot passed in attacks first.</li>
<li>Robots alternate turns attacking. Tactics are used in order.</li>
<li>A fight is over when a robot has 0 or less health or both robots have run out of tactics.</li>
<li>A robot who has no tactics left does no more damage, but the other robot may use the rest of his tactics.</li>
<li>If both robots run out of tactics, whoever has the most health wins. If one robot has 0 health, the other wins. Return the message "{Name} has won the fight."</li>
<li>If both robots run out of tactics and are tied for health, the fight is a draw. Return "The fight was a draw."</li>
</ul>
<p><strong>To Java warriors</strong></p>
<p><code>Robot</code> class is immutable.</p>
<div style="width: 320px; text-align: center; color: white; border: white 1px solid;">
Check out my other 80's Kids Katas:
</div>
<div>
<a href="http://www.codewars.com/kata/80-s-kids-number-1-how-many-licks-does-it-take" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #1:</span> How Many Licks Does It Take</a><br>

<p><a href="http://www.codewars.com/kata/80-s-kids-number-2-help-alf-find-his-spaceship" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #2:</span> Help Alf Find His Spaceship</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-3-punky-brewsters-socks" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #3:</span> Punky Brewster's Socks</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-4-legends-of-the-hidden-temple" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #4:</span> Legends of the Hidden Temple</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-5-you-cant-do-that-on-television" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #5:</span> You Can't Do That on Television</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-6-rock-em-sock-em-robots" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #6:</span> Rock 'Em, Sock 'Em Robots</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-7-shes-a-small-wonder" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #7:</span> She's a Small Wonder</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-8-the-secret-world-of-alex-mack" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #8:</span> The Secret World of Alex Mack</a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-9-down-in-fraggle-rock" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #9:</span> Down in Fraggle Rock </a><br></p>
<p><a href="http://www.codewars.com/kata/80-s-kids-number-10-captain-planet" style="text-decoration:none" data-turbolinks="false" target="_blank"><span style="color:#00C5CD">80's Kids #10:</span> Captain Planet </a><br></p>
</div>
</div>