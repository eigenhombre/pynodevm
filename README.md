pynodevm
========

Ubuntu Vagrant VM for Python, Node.js, Meteor, ZeroMQ, MongoDB, Postgres, ...

This is made somewhat tricky by the currently very fast-evolving
Node/Meteor story and the relative lack of stable, working Puppet
plugins for same. We have to sort of wing it and roll our own. I'm
quite certain the Puppet code is non-idiomatic, but expediency +
repeatability were my main priorities.

To pick up required puppet Python submodule:

* `git submodule init`
* `git submodule update`

## Author

[John Jacobsen](http://eigenhombre.com)

## License

Eclipse Public License, except for bash/install-meteor.sh which is MIT license as per 
https://github.com/meteor/meteor/blob/devel/LICENSE.txt


THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.
