package com.babylonhx.mesh;

import com.babylonhx.math.Matrix;
import com.babylonhx.math.Vector3;
import com.babylonhx.math.Vector2;
import com.babylonhx.math.Vector4;
import com.babylonhx.math.Color4;
import com.babylonhx.mesh.MeshBuilder;

import lime.utils.UInt8Array;
import lime.utils.Float32Array;
import lime.utils.Int32Array;

/**
 * ...
 * @author Krtolica Vujadin
 */

@:expose('BABYLON.VertexData') class VertexData {
	
	public var positions:Float32Array;
	public var normals:Float32Array;
	public var tangents:Float32Array;
	public var uvs:Float32Array;
	public var uvs2:Float32Array;
	public var uvs3:Float32Array;
	public var uvs4:Float32Array;
	public var uvs5:Float32Array;
	public var uvs6:Float32Array;
	public var colors:Float32Array;
	public var matricesIndices:Float32Array;
	public var matricesWeights:Float32Array;
	public var matricesIndicesExtra:Float32Array;
    public var matricesWeightsExtra:Float32Array;
	public var indices:Int32Array;
	
	// for ribbon
	public var _idx:Array<Int>;
	
	
	public function new() { }

	public function set(data:Float32Array, kind:String) {
		switch (kind) {
			case VertexBuffer.PositionKind:
				this.positions = data;
				
			case VertexBuffer.NormalKind:
				this.normals = data;
				
			case VertexBuffer.TangentKind:
				this.tangents = data;
				
			case VertexBuffer.UVKind:
				this.uvs = data;
				
			case VertexBuffer.UV2Kind:
				this.uvs2 = data;
				
			case VertexBuffer.UV3Kind:
				this.uvs3 = data;
				
			case VertexBuffer.UV4Kind:
				this.uvs4 = data;
				
			case VertexBuffer.UV5Kind:
				this.uvs5 = data;
				
			case VertexBuffer.UV6Kind:
				this.uvs6 = data;				
				
			case VertexBuffer.ColorKind:
				this.colors = data;
				
			case VertexBuffer.MatricesIndicesKind:
				this.matricesIndices = data;
				
			case VertexBuffer.MatricesWeightsKind:
				this.matricesWeights = data;
				
			case VertexBuffer.MatricesIndicesExtraKind:
                this.matricesIndicesExtra = data;
                
            case VertexBuffer.MatricesWeightsExtraKind:
                this.matricesWeightsExtra = data;
				
			default:
				// nothing
				
		}
	}

	/**
	 * Associates the vertexData to the passed Mesh.  
	 * Sets it as updatable or not (default `false`).  
	 * Returns the VertexData.  
	 */
	public function applyToMesh(mesh:Mesh, updatable:Bool = false):VertexData {
		this._applyTo(mesh, updatable);
		return this;
	}

	/**
	 * Associates the vertexData to the passed Geometry.  
	 * Sets it as updatable or not (default `false`).  
	 * Returns the VertexData.  
	 */
	public function applyToGeometry(geometry:Geometry, updatable:Bool = false):VertexData {
		this._applyTo(geometry, updatable);
		return this;
	}

	/**
	 * Updates the associated mesh.  
	 * Returns the VertexData.  
	 */
	public function updateMesh(mesh:Mesh, ?updateExtends:Bool, makeItUnique:Bool = false):VertexData {
		this._update(mesh);
		return this;
	}

	/**
	 * Updates the associated geometry.  
	 * Returns the VertexData.  
	 */
	public function updateGeometry(geometry:Geometry, ?updateExtends:Bool, makeItUnique:Bool = false):VertexData {
		this._update(geometry);
		return this;
	}

	private function _applyTo(meshOrGeometry:IGetSetVerticesData, updatable:Bool = false) {
		if (this.positions != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.PositionKind, this.positions, updatable);
		}
		
		if (this.normals != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.NormalKind, this.normals, updatable);
		}
		
		if (this.tangents != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.TangentKind, this.tangents, updatable);
		}
		
		if (this.uvs != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UVKind, this.uvs, updatable);
		}
		
		if (this.uvs2 != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UV2Kind, this.uvs2, updatable);
		}
		
		if (this.uvs3 != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UV3Kind, this.uvs3, updatable);
		}
		
		if (this.uvs4 != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UV4Kind, this.uvs4, updatable);
		}
		
		if (this.uvs5 != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UV5Kind, this.uvs5, updatable);
		}
		
		if (this.uvs6 != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.UV6Kind, this.uvs6, updatable);
		}
		
		if (this.colors != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.ColorKind, this.colors, updatable);
		}
		
		if (this.matricesIndices != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.MatricesIndicesKind, this.matricesIndices, updatable);
		}
		
		if (this.matricesWeights != null) {
			meshOrGeometry.setVerticesData(VertexBuffer.MatricesWeightsKind, this.matricesWeights, updatable);
		}
		
		if (this.matricesIndicesExtra != null) {
            meshOrGeometry.setVerticesData(VertexBuffer.MatricesIndicesExtraKind, this.matricesIndicesExtra, updatable);
        }
		
        if (this.matricesWeightsExtra != null) {
            meshOrGeometry.setVerticesData(VertexBuffer.MatricesWeightsExtraKind, this.matricesWeightsExtra, updatable);
        }
		
		if (this.indices != null) {
			meshOrGeometry.setIndices(this.indices);
		}
	}

	private function _update(meshOrGeometry:IGetSetVerticesData, ?updateExtends:Bool, makeItUnique:Bool = false) {
		if (this.positions != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.PositionKind, this.positions, updateExtends, makeItUnique);
		}
		
		if (this.normals != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.NormalKind, this.normals, updateExtends, makeItUnique);
		}
		
		if (this.tangents != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.TangentKind, this.tangents, updateExtends, makeItUnique);
		}
		
		if (this.uvs != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UVKind, this.uvs, updateExtends, makeItUnique);
		}
		
		if (this.uvs2 != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UV2Kind, this.uvs2, updateExtends, makeItUnique);
		}
		
		if (this.uvs3 != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UV3Kind, this.uvs3, updateExtends, makeItUnique);
		}
		
		if (this.uvs4 != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UV4Kind, this.uvs4, updateExtends, makeItUnique);
		}
		
		if (this.uvs5 != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UV5Kind, this.uvs5, updateExtends, makeItUnique);
		}
		
		if (this.uvs6 != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.UV6Kind, this.uvs6, updateExtends, makeItUnique);
		}
		
		if (this.colors != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.ColorKind, this.colors, updateExtends, makeItUnique);
		}
		
		if (this.matricesIndices != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.MatricesIndicesKind, this.matricesIndices, updateExtends, makeItUnique);
		}
		
		if (this.matricesWeights != null) {
			meshOrGeometry.updateVerticesData(VertexBuffer.MatricesWeightsKind, this.matricesWeights, updateExtends, makeItUnique);
		}
		
		if (this.matricesIndicesExtra != null) {
            meshOrGeometry.updateVerticesData(VertexBuffer.MatricesIndicesExtraKind, this.matricesIndicesExtra, updateExtends, makeItUnique);
        }
		
        if (this.matricesWeightsExtra != null) {
            meshOrGeometry.updateVerticesData(VertexBuffer.MatricesWeightsExtraKind, this.matricesWeightsExtra, updateExtends, makeItUnique);
        }
		
		if (this.indices != null) {
			meshOrGeometry.setIndices(this.indices);
		}
	}

	static var transformed:Vector3 = Vector3.Zero();
	inline public function transform(matrix:Matrix):VertexData {		
		if (this.positions != null) {
			var position = Vector3.Zero();
			
			var index:Int = 0;
			while(index < this.positions.length) {
				Vector3.FromFloat32ArrayToRef(this.positions, index, position);
				
				Vector3.TransformCoordinatesToRef(position, matrix, transformed);
				this.positions[index] = transformed.x;
				this.positions[index + 1] = transformed.y;
				this.positions[index + 2] = transformed.z;
				
				index += 3;
			}
		}
		
		if (this.normals != null) {
			var normal = Vector3.Zero();
			
			var index:Int = 0;
			while(index < this.normals.length) {
				Vector3.FromFloat32ArrayToRef(this.normals, index, normal);
				
				Vector3.TransformNormalToRef(normal, matrix, transformed);
				this.normals[index] = transformed.x;
				this.normals[index + 1] = transformed.y;
				this.normals[index + 2] = transformed.z;
				
				index += 3;
			}
		}
		
		if (this.tangents != null) {
			var tangent = Vector4.Zero();
			var tangentTransformed = Vector4.Zero();
			
			var index:Int = 0;
			while (index < this.tangents.length) {
				Vector4.FromFloat32ArrayToRef(this.tangents, index, tangent);
				
				Vector4.TransformNormalToRef(tangent, matrix, tangentTransformed);
				this.tangents[index] = tangentTransformed.x;
				this.tangents[index + 1] = tangentTransformed.y;
				this.tangents[index + 2] = tangentTransformed.z;
				this.tangents[index + 3] = tangentTransformed.w;
				
				index += 4;
			}
		}
		
		return this;
	}

	public function merge(other:VertexData) {
		if (other.indices != null) {
			var tmpIndices:Array<Int> = [];
			
			var offset = Std.int(this.positions != null ? this.positions.length / 3 : 0);
			for (index in 0...other.indices.length) {
				tmpIndices.push(other.indices[index] + offset);
			}
			this.indices = new Int32Array(tmpIndices);
		}
		
		if (other.positions != null) {
			var tmpPositions:Array<Float> = [];
			
			for (index in 0...other.positions.length) {
				tmpPositions.push(other.positions[index]);
			}
			this.positions = new Float32Array(tmpPositions);
		}
		
		if (other.normals != null) {
			var tmpNormals:Array<Float> = [];
			
			for (index in 0...other.normals.length) {
				tmpNormals.push(other.normals[index]);
			}
			this.normals = new Float32Array(tmpNormals);
		}
		
		if (other.tangents != null) {
			var tmpTangents:Array<Float> = [];
			
			for (index in 0...other.normals.length) {
				tmpTangents.push(other.tangents[index]);
			}
			this.tangents = new Float32Array(tmpTangents);
		}
		
		if (other.uvs != null) {
			var tmpUVs:Array<Float> = [];
			
			for (index in 0...other.uvs.length) {
				tmpUVs.push(other.uvs[index]);
			}
			this.uvs = new Float32Array(tmpUVs);
		}
		
		if (other.uvs2 != null) {
			var tmpUVs2:Array<Float> = [];
			
			for (index in 0...other.uvs2.length) {
				tmpUVs2.push(other.uvs2[index]);
			}
			this.uvs2 = new Float32Array(tmpUVs2);
		}
		
		if (other.uvs3 != null) {
			var tmpUVs3:Array<Float> = [];
			
			for (index in 0...other.uvs3.length) {
				tmpUVs3.push(other.uvs3[index]);
			}
			this.uvs3 = new Float32Array(tmpUVs3);
		}
		
		if (other.uvs4 != null) {
			var tmpUVs4:Array<Float> = [];
			
			for (index in 0...other.uvs4.length) {
				tmpUVs4.push(other.uvs4[index]);
			}
			this.uvs4 = new Float32Array(tmpUVs4);
		}
		
		if (other.uvs5 != null) {
			var tmpUVs5:Array<Float> = [];
			
			for (index in 0...other.uvs5.length) {
				tmpUVs5.push(other.uvs5[index]);
			}
			this.uvs5 = new Float32Array(tmpUVs5);
		}
		
		if (other.uvs6 != null) {
			var tmpUVs6:Array<Float> = [];
			
			for (index in 0...other.uvs6.length) {
				tmpUVs6.push(other.uvs6[index]);
			}
			this.uvs6 = new Float32Array(tmpUVs6);
		}
		
		if (other.matricesIndices != null) {
			var tmpMatricesIndices:Array<Float> = [];
			
			for (index in 0...other.matricesIndices.length) {
				tmpMatricesIndices.push(other.matricesIndices[index]);
			}
			this.matricesIndices = new Float32Array(tmpMatricesIndices);
		}
		
		if (other.matricesWeights != null) {
			var tmpMatricesWeights:Array<Float> = [];
			
			for (index in 0...other.matricesWeights.length) {
				tmpMatricesWeights.push(other.matricesWeights[index]);
			}
			this.matricesWeights = new Float32Array(tmpMatricesWeights);
		}
		
		if (other.matricesIndicesExtra != null) {
            var tmpMatricesIndicesExtra:Array<Float> = [];
            
            for (index in 0...other.matricesIndicesExtra.length) {
                tmpMatricesIndicesExtra.push(other.matricesIndicesExtra[index]);
            }
			this.matricesIndicesExtra = new Float32Array(tmpMatricesIndicesExtra);
        }
		
        if (other.matricesWeightsExtra != null) {
            var tmpMatricesWeightsExtra:Array<Float> = [];
            
            for (index in 0...other.matricesWeightsExtra.length) {
                tmpMatricesWeightsExtra.push(other.matricesWeightsExtra[index]);
            }
			this.matricesWeightsExtra = new Float32Array(tmpMatricesWeightsExtra);
        }
		
		if (other.colors != null) {
			var tmpColors:Array<Float> = [];
			
			for (index in 0...other.colors.length) {
				tmpColors.push(other.colors[index]);
			}
			this.colors = new Float32Array(tmpColors);
		}
	}
	
	public function serialize():Dynamic {
		var serializationObject = this.serialize();
		
		if (this.positions != null) {
			serializationObject.positions = this.positions;
		}
		
		if (this.normals != null) {
			serializationObject.normals = this.normals;
		}
		
		if (this.tangents != null) {
			serializationObject.tangents = this.tangents;
		}
		
		if (this.uvs != null) {
			serializationObject.uvs = this.uvs;
		}
		
		if (this.uvs2 != null) {
			serializationObject.uvs2 = this.uvs2;
		}
		
		if (this.uvs3 != null) {
			serializationObject.uvs3 = this.uvs3;
		}
		
		if (this.uvs4 != null) {
			serializationObject.uvs4 = this.uvs4;
		}
		
		if (this.uvs5 != null) {
			serializationObject.uvs5 = this.uvs5;
		}
		
		if (this.uvs6 != null) {
			serializationObject.uvs6 = this.uvs6;
		}
		
		if (this.colors != null) {
			serializationObject.colors = this.colors;
		}
		
		if (this.matricesIndices != null) {
			serializationObject.matricesIndices = this.matricesIndices;
			//serializationObject.matricesIndices._isExpanded = true;
		}
		
		if (this.matricesWeights != null) {
			serializationObject.matricesWeights = this.matricesWeights;
		}
		
		if (this.matricesIndicesExtra != null) {
			serializationObject.matricesIndicesExtra = this.matricesIndicesExtra;
			//serializationObject.matricesIndicesExtra._isExpanded = true;
		}
		
		if (this.matricesWeightsExtra != null) {
			serializationObject.matricesWeightsExtra = this.matricesWeightsExtra;
		}
		
		serializationObject.indices = this.indices;
		
		return serializationObject;
	}

	// Statics
	public static function ExtractFromMesh(mesh:Mesh, copyWhenShared:Bool = false, forceCopy:Bool = false):VertexData {
		return VertexData._ExtractFrom(mesh, copyWhenShared, forceCopy);
	}

	public static function ExtractFromGeometry(geometry:Geometry, copyWhenShared:Bool = false, forceCopy:Bool = false):VertexData {
		return VertexData._ExtractFrom(geometry, copyWhenShared, forceCopy);
	}

	private static function _ExtractFrom(meshOrGeometry:IGetSetVerticesData, copyWhenShared:Bool = false, forceCopy:Bool = false):VertexData {
		var result = new VertexData();
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.PositionKind)) {
			result.positions = meshOrGeometry.getVerticesData(VertexBuffer.PositionKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.NormalKind)) {
			result.normals = meshOrGeometry.getVerticesData(VertexBuffer.NormalKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.TangentKind)) {
			result.tangents = meshOrGeometry.getVerticesData(VertexBuffer.TangentKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UVKind)) {
			result.uvs = meshOrGeometry.getVerticesData(VertexBuffer.UVKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UV2Kind)) {
			result.uvs2 = meshOrGeometry.getVerticesData(VertexBuffer.UV2Kind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UV3Kind)) {
			result.uvs3 = meshOrGeometry.getVerticesData(VertexBuffer.UV3Kind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UV4Kind)) {
			result.uvs4 = meshOrGeometry.getVerticesData(VertexBuffer.UV4Kind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UV5Kind)) {
			result.uvs5 = meshOrGeometry.getVerticesData(VertexBuffer.UV5Kind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.UV6Kind)) {
			result.uvs6 = meshOrGeometry.getVerticesData(VertexBuffer.UV6Kind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.ColorKind)) {
			result.colors = meshOrGeometry.getVerticesData(VertexBuffer.ColorKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.MatricesIndicesKind)) {
			result.matricesIndices = meshOrGeometry.getVerticesData(VertexBuffer.MatricesIndicesKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.MatricesWeightsKind)) {
			result.matricesWeights = meshOrGeometry.getVerticesData(VertexBuffer.MatricesWeightsKind, copyWhenShared, forceCopy);
		}
		
		if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.MatricesIndicesExtraKind)) {
            result.matricesIndicesExtra = meshOrGeometry.getVerticesData(VertexBuffer.MatricesIndicesExtraKind, copyWhenShared, forceCopy);
        }
		
        if (meshOrGeometry.isVerticesDataPresent(VertexBuffer.MatricesWeightsExtraKind)) {
            result.matricesWeightsExtra = meshOrGeometry.getVerticesData(VertexBuffer.MatricesWeightsExtraKind, copyWhenShared, forceCopy);
        }
		
		result.indices = meshOrGeometry.getIndices(copyWhenShared);
		
		return result;
	}
	
	public static function CreateRibbon(options:Dynamic):VertexData {
		var pathArray:Array<Array<Vector3>> = cast(options.pathArray);
		var closeArray:Bool = options.closeArray != null ? options.closeArray : false;
		var closePath:Bool = options.closePath != null ? options.closePath : false;
		var defaultOffset:Int = Math.floor(pathArray[0].length / 2);
		var offset:Int = options.offset != null ? options.offset : defaultOffset;
		offset = offset > defaultOffset ? defaultOffset : Math.floor(offset); // offset max allowed : defaultOffset
		var	sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var us:Array<Array<Float>> = [];        		// us[path_id] = [uDist1, uDist2, uDist3 ... ] distances between points on path path_id
		var vs:Array<Array<Float>> = [];        		// vs[i] = [vDist1, vDist2, vDist3, ... ] distances between points i of consecutives paths from pathArray
		var uTotalDistance:Array<Float> = []; 			// uTotalDistance[p] : total distance of path p
		var vTotalDistance:Array<Float> = []; 			//  vTotalDistance[i] : total distance between points i of first and last path from pathArray
		var minlg:Int = 0;          	        		// minimal length among all paths from pathArray
		var vectlg:Float = 0;
		var dist:Float = 0;
		var lg:Array<Int> = [];        		    		// array of path lengths : nb of vertex per path
		var idx:Array<Int> = [];       		    		// array of path indexes : index of each path (first vertex) in the total vertex number
		
		var p:Int = 0;									// path iterator
		var i:Int = 0;									// point iterator
		var j:Int = 0;									// point iterator
		
		// if single path in pathArray
		if (pathArray.length < 2) {
			var ar1:Array<Vector3> = [];
			var ar2:Array<Vector3> = [];
			for (i in 0...pathArray[0].length - offset) {
				ar1.push(pathArray[0][i]);
				ar2.push(pathArray[0][i + offset]);
			}
			pathArray = [ar1, ar2];
		}
		
		// positions and horizontal distances (u)
		var idc:Int = 0;
		var closePathCorr:Int = closePath ? 1 : 0;
		var path:Array<Vector3> = [];
		var l:Int = 0;
		minlg = pathArray[0].length;
		for (p in 0...pathArray.length) {
			uTotalDistance[p] = 0;
			us[p] = [0];
			path = pathArray[p];
			
			l = path.length;
			minlg = (minlg < l) ? minlg : l;
			
			j = 0;
			while (j < l) {
				positions.push(path[j].x);
				positions.push(path[j].y);
				positions.push(path[j].z);
				if (j > 0) {
					var vectlg = path[j].subtract(path[j - 1]).length();
					var dist = vectlg + uTotalDistance[p];
					us[p].push(dist);
					uTotalDistance[p] = dist;
				}
				j++;
			}
			
			if (closePath) {
				j--;
				positions.push(path[0].x);
				positions.push(path[0].y);
				positions.push(path[0].z);
				vectlg = path[j].subtract(path[0]).length();
				dist = vectlg + uTotalDistance[p];
				us[p].push(dist);
				uTotalDistance[p] = dist;
			}
			
			lg[p] = l + closePathCorr;
			idx[p] = idc;
			idc += (l + closePathCorr);
		}
		
		// vertical distances (v)
		var path1:Array<Vector3> = [];
		var path2:Array<Vector3> = [];
		var vertex1:Vector3;
		var vertex2:Vector3;
		for (i in 0...minlg + closePathCorr) {
			vTotalDistance[i] = 0;
			vs[i] = [0];
			for (p in 0...pathArray.length - 1) {
				path1 = pathArray[p];
				path2 = pathArray[p + 1];
				if (i == minlg) {   // closePath
					vertex1 = path1[0];
					vertex2 = path2[0];
				}
				else {
					vertex1 = path1[i];
					vertex2 = path2[i];
				}
				vectlg = vertex2.subtract(vertex1).length();
				dist = vectlg + vTotalDistance[i];
				vs[i].push(dist);
				vTotalDistance[i] = dist;
			}
			if (closeArray) {
				path1 = pathArray[p];
				path2 = pathArray[0];
				if (i == minlg) {   // closePath
					vertex2 = path2[0];
				}
				vectlg = path2[i].subtract(path1[i]).length();
				dist = vectlg + vTotalDistance[i];
				vTotalDistance[i] = dist;
			}
		}
		
		// uvs            
		var u:Float = 0;
		var v:Float = 0;
		for (p in 0...pathArray.length) {
			for (i in 0...minlg + closePathCorr) {
				u = us[p][i] / uTotalDistance[p];
				v = vs[i][p] / vTotalDistance[i];
				uvs.push(u);
				uvs.push(v);
			}
		}
		
		// indices
		p = 0;                    									  // path index
		var pi:Int = 0;                    							  // positions array index
		var l1:Int = lg[p] - 1;           							  // path1 length
		var l2:Int = lg[p + 1] - 1;         						  // path2 length
		var min:Int = (l1 < l2) ? l1 : l2;   						  // current path stop index
		var shft:Int = idx[1] - idx[0];         					  // shift 
		var path1nb:Int = closeArray ? lg.length : lg.length - 1;     // number of path1 to iterate	on
		
		while (pi <= min && p < path1nb) {       	//  stay under min and don't go over next to last path
			// draw two triangles between path1 (p1) and path2 (p2) : (p1.pi, p2.pi, p1.pi+1) and (p2.pi+1, p1.pi+1, p2.pi) clockwise
			indices.push(pi);
			indices.push(pi + shft);
			indices.push(pi + 1);
			indices.push(pi + shft + 1);
			indices.push(pi + 1);
			indices.push(pi + shft);
			pi += 1;
			if (pi == min) {             			// if end of one of two consecutive paths reached, go to next existing path
				p++;
				if (p == lg.length - 1) {          // last path of pathArray reached <=> closeArray == true
					shft = idx[0] - idx[p];
					l1 = lg[p] - 1;
					l2 = lg[0] - 1;
				}
				else {
					shft = idx[p + 1] - idx[p];
					l1 = lg[p] - 1;
					l2 = lg[p + 1] - 1;
				}
				pi = idx[p];
				min = (l1 < l2) ? l1 + pi : l2 + pi;
			}
		}
		
		// normals
		VertexData.ComputeNormals(positions, indices, normals);
		
		if (closePath) {
			var indexFirst:Int = 0;
			var indexLast:Int = 0;
			for (p in 0...pathArray.length) {
				indexFirst = idx[p] * 3;
				if (p + 1 < pathArray.length) {
					indexLast = (idx[p + 1] - 1) * 3;
				}
				else {
					indexLast = normals.length - 3;
				}
				normals[indexFirst] = (normals[indexFirst] + normals[indexLast]) * 0.5;
				normals[indexFirst + 1] = (normals[indexFirst + 1] + normals[indexLast + 1]) * 0.5;
				normals[indexFirst + 2] = (normals[indexFirst + 2] + normals[indexLast + 2]) * 0.5;
				normals[indexLast] = normals[indexFirst];
				normals[indexLast + 1] = normals[indexFirst + 1];
				normals[indexLast + 2] = normals[indexFirst + 2];
			}
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		if (closePath) {
			vertexData._idx = idx;
		}
		
		return vertexData;
	}
	
	public static function CreateBox(options:Dynamic):VertexData {
		var normalsSource = [
			new Vector3(0, 0, 1),
			new Vector3(0, 0, -1),
			new Vector3(1, 0, 0),
			new Vector3(-1, 0, 0),
			new Vector3(0, 1, 0),
			new Vector3(0, -1, 0)
		];
		
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var width:Float = options.width;
		var height:Float = options.height;
		var depth:Float = options.depth;
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		var faceUV:Array<Vector4> = options.faceUV != null ? options.faceUV : new Array<Vector4>();
		var faceColors:Array<Color4> = options.faceColors;
		var colors:Array<Float> = [];
		
		for (f in 0...6) {
			if (faceUV[f] == null) {
				faceUV[f] = new Vector4(0, 0, 1, 1);
			}
			if (faceColors != null && faceColors[f] == null) {
				faceColors[f] = new Color4(1, 1, 1, 1);
			}
		}
		
		var scaleVector = new Vector3(width / 2, height / 2, depth / 2);
		
		// Create each face in turn.
		for (index in 0...normalsSource.length) {
			var normal:Vector3 = normalsSource[index];
			
			// Get two vectors perpendicular to the face normal and to each other.
			var side1:Vector3 = new Vector3(normal.y, normal.z, normal.x);
			var side2:Vector3 = Vector3.Cross(normal, side1);
			
			// Six indices (two triangles) per face.
			var verticesLength = Std.int(positions.length / 3);
			indices.push(verticesLength);
			indices.push(verticesLength + 1);
			indices.push(verticesLength + 2);
			
			indices.push(verticesLength);
			indices.push(verticesLength + 2);
			indices.push(verticesLength + 3);
			
			// Four vertices per face.
			var vertex = normal.subtract(side1).subtract(side2).multiply(scaleVector);
			positions.push(vertex.x);
			positions.push(vertex.y);
			positions.push(vertex.z);			
			normals.push(normal.x);
			normals.push(normal.y);
			normals.push(normal.z);
			uvs.push(1.0);
			uvs.push(1.0);			
			if (faceColors != null) {
				colors.push(faceColors[index].r);
				colors.push(faceColors[index].g);
				colors.push(faceColors[index].b);
				colors.push(faceColors[index].a);
			}
			
			vertex = normal.subtract(side1).add(side2).multiply(scaleVector);
			positions.push(vertex.x);
			positions.push(vertex.y);
			positions.push(vertex.z);
			normals.push(normal.x);
			normals.push(normal.y);
			normals.push(normal.z);
			uvs.push(0.0);
			uvs.push(1.0);
			if (faceColors != null) {
				colors.push(faceColors[index].r);
				colors.push(faceColors[index].g);
				colors.push(faceColors[index].b);
				colors.push(faceColors[index].a);
			}
			
			vertex = normal.add(side1).add(side2).multiply(scaleVector);
			positions.push(vertex.x);
			positions.push(vertex.y);
			positions.push(vertex.z);
			normals.push(normal.x);
			normals.push(normal.y);
			normals.push(normal.z);
			uvs.push(0.0);
			uvs.push(0.0);
			if (faceColors != null) {
				colors.push(faceColors[index].r);
				colors.push(faceColors[index].g);
				colors.push(faceColors[index].b);
				colors.push(faceColors[index].a);
			}
			
			vertex = normal.add(side1).subtract(side2).multiply(scaleVector);
			positions.push(vertex.x);
			positions.push(vertex.y);
			positions.push(vertex.z);
			normals.push(normal.x);
			normals.push(normal.y);
			normals.push(normal.z);
			uvs.push(1.0);
			uvs.push(0.0);
			if (faceColors != null) {
				colors.push(faceColors[index].r);
				colors.push(faceColors[index].g);
				colors.push(faceColors[index].b);
				colors.push(faceColors[index].a);
			}
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		if (faceColors != null && faceColors.length > 0) {
			var totalColors = (sideOrientation == Mesh.DOUBLESIDE) ? colors.concat(colors) : colors;
			vertexData.colors = new Float32Array(totalColors);
		}
		
		return vertexData;
	}
	
	public static function CreateSphere(options:Dynamic):VertexData {				
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var	segments:Int = options.segments != null ? options.segments : 32;
		var	diameterX:Float = options.diameterX != null ? options.diameterX : 1;
		var	diameterY:Float = options.diameterY != null ? options.diameterY : 1;
		var	diameterZ:Float = options.diameterZ != null ? options.diameterZ : 1;
		if (options.diameter != null) {
			diameterX = diameterY = diameterZ = options.diameter;
		}
		
		var arc:Float = options.arc != null ? options.arc : 1.0;
		if (arc < 0) {
			arc = 1.0;
		}
		var slice:Float = options.slice ? options.slice : 1.0;
		if (slice < 0) {
			slice = 1.0;
		}
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		var radius:Vector3 = new Vector3(diameterX / 2, diameterY / 2, diameterZ / 2);
		var totalZRotationSteps:Int = 2 + segments;
		var totalYRotationSteps:Int = 2 * totalZRotationSteps;
		
		for (zRotationStep in 0...totalZRotationSteps + 1) {
			var normalizedZ = zRotationStep / totalZRotationSteps;
			var angleZ = (normalizedZ * Math.PI);
			for (yRotationStep in 0...totalYRotationSteps + 1) {
				var normalizedY:Float = yRotationStep / totalYRotationSteps;
				var angleY:Float = normalizedY * Math.PI * 2;
				var rotationZ:Matrix = Matrix.RotationZ(-angleZ);
				var rotationY:Matrix = Matrix.RotationY(angleY);
				var afterRotZ:Vector3 = Vector3.TransformCoordinates(Vector3.Up(), rotationZ);
				var complete:Vector3 = Vector3.TransformCoordinates(afterRotZ, rotationY);
				var vertex:Vector3 = complete.multiply(radius);
				var normal:Vector3 = Vector3.Normalize(vertex);
				positions.push(vertex.x);
				positions.push(vertex.y);
				positions.push(vertex.z);
				normals.push(normal.x);
				normals.push(normal.y);
				normals.push(normal.z);
				uvs.push(normalizedY);
				uvs.push(normalizedZ);
			}
			if (zRotationStep > 0) {
				var verticesCount = positions.length / 3;
				var firstIndex = Std.int(verticesCount - 2 * (totalYRotationSteps + 1));
				while ((firstIndex + totalYRotationSteps + 2) < verticesCount) {
					indices.push(firstIndex);
					indices.push(firstIndex + 1);
					indices.push(firstIndex + totalYRotationSteps + 1);
					indices.push(firstIndex + totalYRotationSteps + 1);
					indices.push(firstIndex + 1);
					indices.push(firstIndex + totalYRotationSteps + 2);
					
					++firstIndex;
				}
			}
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}

	// Cylinder and cone 
	public static function CreateCylinder(options:Dynamic):VertexData {	
		var height:Float = options.height != null ? options.height : 2;
		var diameterTop:Float = options.diameterTop != null ? options.diameterTop : 1;
		var diameterBottom:Float = options.diameterBottom != null ? options.diameterBottom : 1;
		var tessellation:Int = options.tessellation != null ? options.tessellation : 24;
		var subdivisions:Int = options.subdivisions != null ? options.subdivisions : 1;
		var hasRings:Bool = options.hasRings != null ? options.hasRings : false;
		var enclose:Bool = options.enclose != null ? options.enclose : false;
		var arc:Float = options.arc != null ? options.arc : 1.0;
		if (arc <= 0 || arc > 1) arc = 1;
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		var faceUV:Array<Vector4> = options.faceUV != null ? options.faceUV : [];
		var faceColors:Array<Color4> = options.faceColors != null ? options.faceColors : null;
		
		// default face colors and UV if undefined
		var quadNb:Int = (arc != 1 && enclose) ? 2 : 0;
		var ringNb:Int = (hasRings) ? subdivisions : 1;
		var surfaceNb:Int = 2 + (1 + quadNb) * ringNb;
		for (f in 0...surfaceNb) {
			if (faceColors != null && faceColors[f] == null) {
				faceColors[f] = new Color4(1, 1, 1, 1);
			}
		}
		for (f in 0...surfaceNb) {
			if (faceUV != null && faceUV[f] == null) {
				faceUV[f] = new Vector4(0, 0, 1, 1);
			}
		}
		
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		var colors:Array<Float> = [];
		
		var angle_step:Float = Math.PI * 2 * arc / tessellation;
		var angle:Float = 0;
		var h:Float = 0;
		var radius:Float = 0;
		var tan:Float = (diameterBottom - diameterTop) / 2 / height;
		var ringVertex:Vector3 = Vector3.Zero();
		var ringNormal:Vector3 = Vector3.Zero();
		var ringFirstVertex:Vector3 = Vector3.Zero();
		var ringFirstNormal:Vector3 = Vector3.Zero();
		var quadNormal:Vector3 = Vector3.Zero();
		var Y:Vector3 = com.babylonhx.math.Axis.Y;
		
		// positions, normals, uvs
		var ringIdx:Int = 1;
		var s:Int = 1;			// surface index
		var cs:Float = 0;
		var v:Float = 0;
		
		for (i in 0...subdivisions + 1) {
			h = i / subdivisions;
			radius = (h * (diameterTop - diameterBottom) + diameterBottom) / 2;
			ringIdx = (hasRings && i != 0 && i != subdivisions) ? 2 : 1;
			for (r in 0...ringIdx) {
				if (hasRings) {
					s += r;
				}
				if (enclose) {
					s += 2 * r;
				}
				for (j in 0...tessellation + 1) {
					angle = j * angle_step;
					
					// position
					ringVertex.x = Math.cos(-angle) * radius;
					ringVertex.y = -height / 2 + h * height;
					ringVertex.z = Math.sin( -angle) * radius;
					
					// normal
					if (diameterTop == 0 && i == subdivisions) {
						// if no top cap, reuse former normals
						ringNormal.x = normals[normals.length - (tessellation + 1) * 3];
						ringNormal.y = normals[normals.length - (tessellation + 1) * 3 + 1];
						ringNormal.z = normals[normals.length - (tessellation + 1) * 3 + 2];
					}
					else {
						ringNormal.x = ringVertex.x;
						ringNormal.z = ringVertex.z;
						ringNormal.y = Math.sqrt(ringNormal.x * ringNormal.x + ringNormal.z * ringNormal.z) * tan;
						ringNormal.normalize();
					}
					
					// keep first ring vertex values for enclose
					if (j == 0) {
						ringFirstVertex.copyFrom(ringVertex);
						ringFirstNormal.copyFrom(ringNormal);
					}
					
					positions.push(ringVertex.x);
					positions.push(ringVertex.y);
					positions.push(ringVertex.z);
					normals.push(ringNormal.x);
					normals.push(ringNormal.y);
					normals.push(ringNormal.z);
					if (hasRings) {
						v = (cs != s) ? faceUV[s].y : faceUV[s].w;
					} 
					else {
						v = faceUV[s].y + (faceUV[s].w - faceUV[s].y) * h;
					}
					uvs.push(faceUV[s].x + (faceUV[s].z - faceUV[s].x) * j / tessellation);
					uvs.push(v);
					if (faceColors != null) {
						colors.push(faceColors[s].r);
						colors.push(faceColors[s].g);
						colors.push(faceColors[s].b);
						colors.push(faceColors[s].a);
					}
				}
				
				// if enclose, add four vertices and their dedicated normals
				if (arc != 1 && enclose) {
					positions.push(ringVertex.x);
					positions.push(ringVertex.y);
					positions.push(ringVertex.z);
					positions.push(0);
					positions.push(ringVertex.y);
					positions.push(0);
					positions.push(0);
					positions.push(ringVertex.y);
					positions.push(0);
					positions.push(ringFirstVertex.x);
					positions.push(ringFirstVertex.y);
					positions.push(ringFirstVertex.z);
					Vector3.CrossToRef(Y, ringNormal, quadNormal);
					quadNormal.normalize();
					normals.push(quadNormal.x);
					normals.push(quadNormal.y);
					normals.push(quadNormal.z);
					normals.push(quadNormal.x);
					normals.push(quadNormal.y);
					normals.push( quadNormal.z);
					Vector3.CrossToRef(ringFirstNormal, Y, quadNormal);
					quadNormal.normalize();
					normals.push(quadNormal.x);
					normals.push(quadNormal.y);
					normals.push(quadNormal.z);
					normals.push(quadNormal.x);
					normals.push(quadNormal.y);
					normals.push(quadNormal.z);
					if (hasRings) {
						v = (cs != s) ? faceUV[s + 1].y : faceUV[s + 1].w;
					} 
					else {
						v = faceUV[s + 1].y + (faceUV[s + 1].w - faceUV[s + 1].y) * h;
					}
					uvs.push(faceUV[s + 1].x);
					uvs.push(v);
					uvs.push(faceUV[s + 1].z);
					uvs.push(v);
					if (hasRings) {
						v = (cs != s) ? faceUV[s + 2].y : faceUV[s + 2].w;
					} 
					else {
						v = faceUV[s + 2].y + (faceUV[s + 2].w - faceUV[s + 2].y) * h;
					}
					uvs.push(faceUV[s + 2].x);
					uvs.push(v);
					uvs.push(faceUV[s + 2].z);
					uvs.push(v);
					if (faceColors.length > 0) {
						colors.push(faceColors[s + 1].r);
						colors.push(faceColors[s + 1].g);
						colors.push(faceColors[s + 1].b);
						colors.push(faceColors[s + 1].a);
						colors.push(faceColors[s + 1].r);
						colors.push(faceColors[s + 1].g);
						colors.push(faceColors[s + 1].b);
						colors.push(faceColors[s + 1].a);
						colors.push(faceColors[s + 2].r);
						colors.push(faceColors[s + 2].g);
						colors.push(faceColors[s + 2].b);
						colors.push(faceColors[s + 2].a);
						colors.push(faceColors[s + 2].r);
						colors.push(faceColors[s + 2].g);
						colors.push(faceColors[s + 2].b);
						colors.push(faceColors[s + 2].a);
					}
				}
			}
		}
		
		// indices
		var e:Int = (arc != 1 && enclose) ? tessellation + 4 : tessellation;     // correction of number of iteration if enclose
		var i:Int = 0;
		var i0:Int = 0;
		var i1:Int = 0;
		var i2:Int = 0;
		var i3:Int = 0;
		for (s in 0...subdivisions) {
			for (j in 0...tessellation) {
				i0 = i * (e + 1) + j;
				i1 = (i + 1) * (e + 1) + j;
				i2 = i * (e + 1) + (j + 1);
				i3 = (i + 1) * (e + 1) + (j + 1);
				indices.push(i0);
				indices.push(i1);
				indices.push(i2);
				indices.push(i3);
				indices.push(i2);
				indices.push(i1);
			}
			if (arc != 1 && enclose) {      // if enclose, add two quads
				indices.push(i0 + 2);
				indices.push(i1 + 2);
				indices.push(i2 + 2);
				indices.push(i3 + 2);
				indices.push(i2 + 2);
				indices.push(i1 + 2);
				indices.push(i0 + 4);
				indices.push(i1 + 4);
				indices.push(i2 + 4);
				indices.push(i3 + 4);
				indices.push(i2 + 4);
				indices.push(i1 + 4);
			}
			i = (hasRings) ? (i + 2) : (i + 1);
		}
		
		// Caps
		var createCylinderCap = function(isTop:Bool) {
			var radius = isTop ? diameterTop / 2 : diameterBottom / 2;
			if (radius == 0) {
				return;
			}
			
			// Cap positions, normals & uvs
			var angle:Float = 0;
			var circleVector:Vector3 = null;
			var u:Vector4 = isTop ? faceUV[2] : faceUV[0];
			var c:Color4 = null;
			if (faceColors != null) {
				c = isTop ? faceColors[2] : faceColors[0];
			}
			// cap center
			var vbase:Int = Std.int(positions.length / 3);
			var offset:Float = isTop ? height / 2 : -height / 2;
			var center:Vector3 = new Vector3(0, offset, 0);
			positions.push(center.x);
			positions.push(center.y);
			positions.push(center.z);
			normals.push(0);
			normals.push(isTop ? 1 : -1);
			normals.push(0);
			uvs.push(u.x + (u.z - u.x) * 0.5);
			uvs.push(u.y + (u.w - u.y) * 0.5);
			if (faceColors != null) {
				colors.push(c.r);
				colors.push(c.g);
				colors.push(c.b);
				colors.push(c.a);
			}
			
			var textureScale:Vector2 = new Vector2(0.5, 0.5);
			for (i in 0...tessellation+1) {
				angle = Math.PI * 2 * i * arc / tessellation;
				var cos:Float = Math.cos(-angle);
				var sin:Float = Math.sin(-angle);
				circleVector = new Vector3(cos * radius, offset, sin * radius);
				var textureCoordinate = new Vector2(cos * textureScale.x + 0.5, sin * textureScale.y + 0.5);
				positions.push(circleVector.x);
				positions.push(circleVector.y);
				positions.push(circleVector.z);
				normals.push(0);
				normals.push(isTop ? 1 : -1);
				normals.push(0);
				uvs.push(u.x + (u.z - u.x) * textureCoordinate.x);
				uvs.push(u.y + (u.w - u.y) * textureCoordinate.y);
				if (faceColors != null) {
					colors.push(c.r);
					colors.push(c.g);
					colors.push(c.b);
					colors.push(c.a);
				}
			}
			// Cap indices
			for (i in 0...tessellation) {
				if (!isTop) {
					indices.push(vbase);
					indices.push(vbase + (i + 1));
					indices.push(vbase + (i + 2));
				}
				else {
					indices.push(vbase);
					indices.push(vbase + (i + 2));
					indices.push(vbase + (i + 1));
				}
			}
		};
		
		// add caps to geometry
		if (enclose) {
			createCylinderCap(false);
			createCylinderCap(true);
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		if (faceColors != null) {
			vertexData.colors = new Float32Array(colors);
		}
		
		return vertexData;
	}
	
	public static function CreateCapsule(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var radius:Float = options.radius != null ? options.radius : 1;
		var height:Float = options.height != null ? options.height : 2;
		var segmentsW:Int = options.segmentsW != null ? options.segmentsW : 16;
		var segmentsH:Int = options.segmentsH != null ? options.segmentsH : 16;
		var yUp:Bool = options.yUp != null ? options.yUp : true;
		
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		var buildPositionsAndNormals = function(radius:Float = 1, height:Float = 1, segmentsW:Int = 1, segmentsH:Int = 1, yUp:Bool = true):Map<String, Array<Float>> {			
			var vertexPositionData:Array<Float> = [];
			var vertexNormalData:Array<Float> = [];
			
			var startIndex:Int;
			var index:Int = 0;
			var comp1:Float = 0;
			var comp2:Float = 0;
			var t1:Float = 0;
			var t2:Float = 0;
			for (yi in 0...segmentsH + 1) {
				startIndex = index;
				
				var horangle:Float = Math.PI * yi / segmentsH;
				var z:Float = -radius * Math.cos(horangle);
				var ringradius:Float = radius * Math.sin(horangle);
				
				for (xi in 0...segmentsW + 1) {
					var verangle:Float = 2 * Math.PI * xi / segmentsW;
					var x:Float = ringradius * Math.cos(verangle);
					var y:Float = ringradius * Math.sin(verangle);
					var normLen:Float = 1 / Math.sqrt(x * x + y * y + z * z);
					var tanLen:Float = Math.sqrt(y * y + x * x);
					var offset:Float = yi > segmentsH / 2 ? height / 2 : -height / 2;
					
					if (yUp) {
						t1 = 0;
						t2 = tanLen > .007 ? x / tanLen : 0;
						comp1 = -z;
						comp2 = y;
					}
					else {
						t1 = tanLen > .007 ? x / tanLen : 0;
						t2 = 0;
						comp1 = y;
						comp2 = z;
					}
					
					if (xi == segmentsW) {
						vertexPositionData[index] = vertexPositionData[startIndex];
						vertexPositionData[index + 1] = vertexPositionData[startIndex + 1];
						vertexPositionData[index + 2] = vertexPositionData[startIndex + 2];
						
						vertexNormalData[index] = (vertexNormalData[startIndex] + x * normLen) * 0.5;
						vertexNormalData[index + 1] = (vertexNormalData[startIndex + 1] + comp1 * normLen) * 0.5;
						vertexNormalData[index + 2] = (vertexNormalData[startIndex + 2] + comp2 * normLen) * 0.5;
					}
					else {
						vertexPositionData[index] = x;
						vertexPositionData[index + 1] = yUp ? comp1 - offset : comp1;
						vertexPositionData[index + 2] = yUp ? comp2 : comp2 + offset;
						
						vertexNormalData[index] = x * normLen;
						vertexNormalData[index + 1] = comp1 * normLen;
						vertexNormalData[index + 2] = comp2 * normLen;
					}
					
					if (xi > 0 && yi > 0) {
						if (yi == segmentsH) {
							vertexPositionData[index] = vertexPositionData[startIndex];
							vertexPositionData[index + 1] = vertexPositionData[startIndex + 1];
							vertexPositionData[index + 2] = vertexPositionData[startIndex + 2];
						}
					}
					
					index += 3;
				}
			}
			
			var result:Map<String, Array<Float>> = new Map();
			result["positions"] = vertexPositionData;
			result["normals"] = vertexNormalData;
			
			return result;
		}
		
		var buildIndices = function(segmentsW:Int = 1, segmentsH:Int = 1, yUp:Bool = true):Array<Int> {
			var indices:Array<Int> = [];
			
			var numIndices:Int = 0;
			for (yi in 0...segmentsH + 1) {
				for (xi in 0...segmentsW + 1) {
					if (xi > 0 && yi > 0) {
						var a:Int = Std.int((segmentsW + 1) * yi + xi);
						var b:Int = Std.int((segmentsW + 1) * yi + xi - 1);
						var c:Int = Std.int((segmentsW + 1) * (yi - 1) + xi - 1);
						var d:Int = Std.int((segmentsW + 1) * (yi - 1) + xi);
						
						if (yi == segmentsH) {
							indices[numIndices++] = a;
							indices[numIndices++] = c;
							indices[numIndices++] = d;
						}
						else if (yi == 1) {
							indices[numIndices++] = a;
							indices[numIndices++] = b;
							indices[numIndices++] = c;
						}
						else {
							indices[numIndices++] = a;
							indices[numIndices++] = b;
							indices[numIndices++] = c;
							indices[numIndices++] = a;
							indices[numIndices++] = c;
							indices[numIndices++] = d;
						}
					}
				}
			}
			
			indices.reverse();
			
			return indices;
		}
		
		var buildUVs = function(segmentsW:Int = 1, segmentsH:Int = 1):Array<Float> {
			var data:Array<Float> = [];
			var index:Int = 0;
			
			for (yi in 0...segmentsH + 1) {
				for (xi in 0...segmentsW + 1) {
					data[index++] = xi / segmentsW;
					data[index++] = yi / segmentsH;
				}
			}
			
			return data;
		};
		
        var geometryData:Map<String, Array<Float>> = buildPositionsAndNormals(radius, height, segmentsW, segmentsH, yUp);
		
		positions = geometryData["positions"];
		
		normals = geometryData["normals"];
		
        indices = buildIndices(segmentsW, segmentsH, yUp);
		
		uvs = buildUVs(segmentsW, segmentsH);
		
        var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
    }
	
	public static function CreateTorus(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var diameter:Float = options.diameter != null ? options.diameter : 1;
		var thickness:Float = options.thickness != null ? options.thickness : 0.5;
		var tessellation:Int = options.tessellation != null ? options.tessellation : 16;
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		var stride:Int = tessellation + 1;
		
		for (i in 0...tessellation + 1) {
			var u:Float = i / tessellation;			
			var outerAngle:Float = i * Math.PI * 2.0 / tessellation - Math.PI / 2.0;			
			var transform:Matrix = Matrix.Translation(diameter / 2.0, 0, 0).multiply(Matrix.RotationY(outerAngle));
			
			for (j in 0...tessellation + 1) {
				var v = 1 - j / tessellation;
				
				var innerAngle = j * Math.PI * 2.0 / tessellation + Math.PI;
				var dx = Math.cos(innerAngle);
				var dy = Math.sin(innerAngle);
				
				// Create a vertex.
				var normal = new Vector3(dx, dy, 0);
				var position = normal.scale(thickness / 2);
				var textureCoordinate = new Vector2(u, v);
				
				position = Vector3.TransformCoordinates(position, transform);
				normal = Vector3.TransformNormal(normal, transform);
				
				positions.push(position.x);
				positions.push(position.y);
				positions.push(position.z);
				normals.push(normal.x);
				normals.push(normal.y);
				normals.push(normal.z);
				uvs.push(textureCoordinate.x);
				uvs.push(textureCoordinate.y);
				
				// And create indices for two triangles.
				var nextI = (i + 1) % stride;
				var nextJ = (j + 1) % stride;
				
				indices.push(i * stride + j);
				indices.push(i * stride + nextJ);
				indices.push(nextI * stride + j);
				
				indices.push(i * stride + nextJ);
				indices.push(nextI * stride + nextJ);
				indices.push(nextI * stride + j);
			}
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}
	
	// options: { lines:Array<Array<Vector3>> }
	public static function CreateLineSystem(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var lines:Array<Array<Vector3>> = options.lines;
		var idx:Int = 0;
		
		for (l in 0...lines.length) {
			var points = lines[l];
			for (index in 0...points.length) {
				positions.push(points[index].x);
				positions.push(points[index].y);
				positions.push(points[index].z);
				
				if (index > 0) {
					indices.push(idx - 1);
					indices.push(idx);
				}
				idx ++;
			}               
		}
		
		var vertexData = new VertexData();
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);
		
		return vertexData;
	}

	public static function CreateLines(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var points:Array<Vector3> = options.points;
		
		for (index in 0...points.length) {
			positions.push(points[index].x);
			positions.push(points[index].y);
			positions.push(points[index].z);
			
			if (index > 0) {
				indices.push(index - 1);
				indices.push(index);
			}
		}
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);
		
		return vertexData;
	}
	
	public static function CreateDashedLines(options:Dynamic):VertexData {
		var positions:Array<Float> = [];
		var indices:Array<Int> = [];
		
		var dashSize:Float = options.dashSize != null ? options.dashSize : 3;
		var gapSize:Float = options.gapSize != null ? options.gapSize : 1;
		var dashNb:Float = options.dashNb != null ? options.dashNb : 200;
		var points:Array<Vector3> = options.points;
		
		var curvect:Vector3 = Vector3.Zero();
		var lg:Float = 0;
		var nb:Int = 0;
		var shft:Float = 0;
		var dashshft:Float = 0;
		var curshft:Float = 0;
		var idx:Int = 0;
		for (i in 0...points.length - 1) {
			points[i + 1].subtractToRef(points[i], curvect);
			lg += curvect.length();
		}
		shft = lg / dashNb;
		dashshft = dashSize * shft / (dashSize + gapSize);
		for (i in 0...points.length - 1) {
			points[i + 1].subtractToRef(points[i], curvect);
			nb = Math.floor(curvect.length() / shft);
			curvect.normalize();
			for (j in 0...nb) {
				curshft = shft * j;
				positions.push(points[i].x + curshft * curvect.x);
				positions.push(points[i].y + curshft * curvect.y);
				positions.push(points[i].z + curshft * curvect.z);
				positions.push(points[i].x + (curshft + dashshft) * curvect.x);
				positions.push(points[i].y + (curshft + dashshft) * curvect.y);
				positions.push(points[i].z + (curshft + dashshft) * curvect.z);
				indices.push(idx);
				indices.push(idx + 1);
				idx += 2;
			}
		}
		
		// Result
		var vertexData = new VertexData();
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);		
		
		return vertexData;
	}

	public static function CreateGround(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var width:Float = options.width != null ? options.width : 1;
		var height:Float = options.height != null ? options.height : 1;
		var subdivisionsX:Int = options.subdivisionsX != null ? options.subdivisionsX : (options.subdivisions != null ? options.subdivisions : 1);
        var subdivisionsY:Int = options.subdivisionsY != null ? options.subdivisionsY : (options.subdivisions != null ? options.subdivisions : 1);
		
		for (row in 0...subdivisionsY + 1) {
			for (col in 0...subdivisionsX + 1) {
				var position = new Vector3((col * width) / subdivisionsX - (width / 2.0), 0, ((subdivisionsY - row) * height) / subdivisionsY - (height / 2.0));
				var normal = new Vector3(0, 1.0, 0);
				
				positions.push(position.x);
				positions.push(position.y);
				positions.push(position.z);
				normals.push(normal.x);
				normals.push(normal.y);
				normals.push(normal.z);
				uvs.push(col / subdivisionsX);
				uvs.push(1.0 - row / subdivisionsX);
			}
		}
		
		for (row in 0...subdivisionsY) {
			for (col in 0...subdivisionsX) {
				indices.push(col + 1 + (row + 1) * (subdivisionsX + 1));
				indices.push(col + 1 + row * (subdivisionsX + 1));
				indices.push(col + row * (subdivisionsX + 1));
				
				indices.push(col + (row + 1) * (subdivisionsX + 1));
				indices.push(col + 1 + (row + 1) * (subdivisionsX + 1));
				indices.push(col + row * (subdivisionsX + 1));
			}
		}
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);
		vertexData.normals = new Float32Array(normals);
		vertexData.uvs = new Float32Array(uvs);
		
		return vertexData;
	}

	public static function CreateTiledGround(options:Dynamic):VertexData {
		var xmin:Float = options.xmin;
		var zmin:Float = options.zmin;
		var xmax:Float = options.xmax;
		var zmax:Float = options.zmax;
		var subdivisions:Dynamic = options.subdivision != null ? options.subdivision : { w: 1, h: 1 };
		var precision:Dynamic = options.precision != null ? options.precision : { w: 1, h: 1 };
		
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		subdivisions.h = (subdivisions.h < 1) ? 1 : subdivisions.h;
		subdivisions.w = (subdivisions.w < 1) ? 1 : subdivisions.w;
		precision.w = (precision.w < 1) ? 1 : precision.w;
		precision.h = (precision.h < 1) ? 1 : precision.h;
		
		var tileSize = {
			w: (xmax - xmin) / subdivisions.w,
			h: (zmax - zmin) / subdivisions.h
		};
		
		function applyTile(xTileMin:Float, zTileMin:Float, xTileMax:Float, zTileMax:Float) {
			// Indices
			var base = positions.length / 3;
			var rowLength = precision.w + 1;
			for (row in 0...precision.h) {
				for (col in 0...precision.w) {
					var square:Array<Int> = [
						Std.int(base + col + row * rowLength),
						Std.int(base + (col + 1) + row * rowLength),
						Std.int(base + (col + 1) + (row + 1) * rowLength),
						Std.int(base + col + (row + 1) * rowLength)
					];
					
					indices.push(square[1]);
					indices.push(square[2]);
					indices.push(square[3]);
					indices.push(square[0]);
					indices.push(square[1]);
					indices.push(square[3]);
				}
			}
			
			// Position, normals and uvs
			var position = Vector3.Zero();
			var normal = new Vector3(0, 1.0, 0);
			for (row in 0...precision.h + 1) {
				position.z = (row * (zTileMax - zTileMin)) / precision.h + zTileMin;
				for (col in 0...precision.w + 1) {
					position.x = (col * (xTileMax - xTileMin)) / precision.w + xTileMin;
					position.y = 0;
					
					positions.push(position.x);
					positions.push(position.y);
					positions.push(position.z);
					normals.push(normal.x);
					normals.push(normal.y);
					normals.push(normal.z);
					uvs.push(col / precision.w);
					uvs.push(row / precision.h);
				}
			}
		}
		
		for (tileRow in 0...subdivisions.h) {
			for (tileCol in 0...subdivisions.w) {
				applyTile(
					xmin + tileCol * tileSize.w,
					zmin + tileRow * tileSize.h,
					xmin + (tileCol + 1) * tileSize.w,
					zmin + (tileRow + 1) * tileSize.h
					);
			}
		}	
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);
		vertexData.normals = new Float32Array(normals);
		vertexData.uvs = new Float32Array(uvs);
		
		return vertexData;
	}

	public static function CreateGroundFromHeightMap(options:Dynamic):VertexData {
		var width:Float = options.width;
		var height:Float = options.height;
		var subdivisions:Int = options.subdivisions;
		var minHeight:Float = options.minHeight;
		var maxHeight:Float = options.maxHeight;
		var buffer:UInt8Array = options.buffer;
		var bufferWidth:Float = options.bufferWidth;
		var bufferHeight:Float = options.bufferHeight;
		
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		// Vertices
		for (row in 0...subdivisions + 1) {
			for (col in 0...subdivisions + 1) {
				var position = new Vector3((col * width) / subdivisions - (width / 2.0), 0, ((subdivisions - row) * height) / subdivisions - (height / 2.0));
				
				// Compute height
				var heightMapX = Std.int(((position.x + width / 2) / width) * (bufferWidth - 1));
				var heightMapY = Std.int((1.0 - (position.z + height / 2) / height) * (bufferHeight - 1));
				
				var pos = Std.int((heightMapX + heightMapY * bufferWidth) * 4);
				#if !js
				var r = buffer.buffer.get(pos) / 255.0;
				var g = buffer.buffer.get(pos + 1) / 255.0;
				var b = buffer.buffer.get(pos + 2) / 255.0;  // buffer.getUInt8(...
				#else
				var r = buffer[pos] / 255.0;
				var g = buffer[pos + 1] / 255.0;
				var b = buffer[pos + 2] / 255.0;
				#end
								
				var gradient = r * 0.3 + g * 0.59 + b * 0.11;
				position.y = minHeight + (maxHeight - minHeight) * gradient;
				
				// Add  vertex
				positions.push(position.x);
				positions.push(position.y);
				positions.push(position.z);
				normals.push(0);
				normals.push(0);
				normals.push(0);
				uvs.push(col / subdivisions);
				uvs.push(1.0 - row / subdivisions);
			}
		}
		
		// Indices
		for (row in 0...subdivisions) {
			for (col in 0...subdivisions) {
				indices.push(col + 1 + (row + 1) * (subdivisions + 1));
				indices.push(col + 1 + row * (subdivisions + 1));
				indices.push(col + row * (subdivisions + 1));
				
				indices.push(col + (row + 1) * (subdivisions + 1));
				indices.push(col + 1 + (row + 1) * (subdivisions + 1));
				indices.push(col + row * (subdivisions + 1));
			}
		}
		
		// Normals
		VertexData.ComputeNormals(positions, indices, normals);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = new Int32Array(indices);
		vertexData.positions = new Float32Array(positions);
		vertexData.normals = new Float32Array(normals);
		vertexData.uvs = new Float32Array(uvs);
		
		return vertexData;
	}

	public static function CreatePlane(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var	width:Float = options.width != null ? options.width : 1;
		var	height:Float = options.height != null ? options.height : 1;
		var sideOrientation = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		// Vertices
		var halfWidth = width / 2;
		var halfHeight = height / 2;
		
		// Vertices
		positions.push( -halfWidth);
		positions.push( -halfHeight);
		positions.push(0);
		normals.push(0);
		normals.push(0);
		normals.push(-1.0);
		uvs.push(0.0);
		uvs.push(0.0);
		
		positions.push(halfWidth);
		positions.push( -halfHeight);
		positions.push(0);
		normals.push(0);
		normals.push(0);
		normals.push(-1.0);
		uvs.push(1.0);
		uvs.push(0.0);
		
		positions.push(halfWidth);
		positions.push(halfHeight);
		positions.push(0);
		normals.push(0);
		normals.push(0);
		normals.push(-1.0);
		uvs.push(1.0);
		uvs.push(1.0);
		
		positions.push( -halfWidth);
		positions.push(halfHeight);
		positions.push(0);
		normals.push(0);
		normals.push(0);
		normals.push(-1.0);
		uvs.push(0.0);
		uvs.push(1.0);
		
		// Indices
		indices.push(0);
		indices.push(1);
		indices.push(2);
		
		indices.push(0);
		indices.push(2);
		indices.push(3);
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}
	
	/**
	  * Creates the VertexData of the Disc or regular Polygon.
	  */
	public static function CreateDisc(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var radius:Float = options.radius != null ? options.radius : 0.5;
		var tessellation:Int = options.tessellation != null ? options.tessellation : 64;
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		// positions and uvs
		positions.push(0);
		positions.push(0);
		positions.push(0);    // disc center first
		uvs.push(0.5);
		uvs.push(0.5);
		
		var step = Math.PI * 2 / tessellation;
		var a:Float = 0.0;
		while(a < Math.PI * 2) {
			var x = Math.cos(a);
			var y = Math.sin(a);
			var u = (x + 1) / 2;
			var v = (1 - y) / 2;
			positions.push(radius * x);
			positions.push(radius * y);
			positions.push(0);
			uvs.push(u);
			uvs.push(v);
			
			a += step;
		}
		positions.push(positions[3]);
		positions.push(positions[4]);
		positions.push(positions[5]); // close the circle
		uvs.push(uvs[2]);
		uvs.push(uvs[3]);
		
		//indices
		var vertexNb = Std.int(positions.length / 3);
		for (i in 1...vertexNb-1) {
			indices.push(i + 1);
			indices.push(0);
			indices.push(i);
		}
		
		// result
		VertexData.ComputeNormals(positions, indices, normals);
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}
	
	/**
	 * Re-creates the VertexData of the Polygon for sideOrientation.  
	 */
	public static function CreatePolygon(polygon:Mesh, sideOrientation:Int, ?fUV:Array<Vector4>, ?fColors:Array<Color4>, ?frontUVs:Vector4, ?backUVs:Vector4) {
		var faceUV:Array<Vector4> = fUV != null ? fUV : [];
		var faceColors:Array<Color4> = fColors;
		var colors:Array<Float> = [];
		
		// default face colors and UV if undefined
		for (f in 0...3) {
			if (faceUV[f] == null) {
				faceUV[f] = new Vector4(0, 0, 1, 1);
			}
			if (faceColors != null && faceColors[f] == null) {
				faceColors[f] = new Color4(1, 1, 1, 1);
			}
		}
		
		var positions = polygon.getVerticesData(VertexBuffer.PositionKind);
		var normals = polygon.getVerticesData(VertexBuffer.NormalKind);
		var uvs = polygon.getVerticesData(VertexBuffer.UVKind);
		var indices = polygon.getIndices();
		
		// set face colours and textures
		var idx:Int = 0;
		var face:Int = 0;
		var index:Int = 0;
		while (index < normals.length) { 
			//Edge Face  no. 1
			if(Math.abs(normals[index + 1]) < 0.001) {
			   face = 1; 
			}
			//Top Face  no. 0
			if(Math.abs(normals[index + 1] - 1) < 0.001) {
			   face = 0; 
			}
			//Bottom Face  no. 2
			if(Math.abs(normals[index + 1] + 1) < 0.001) {
			   face = 2; 
			}
			idx = Std.int(index / 3);
			uvs[2 * idx] = (1 - uvs[2 * idx]) * faceUV[face].x + uvs[2 * idx] * faceUV[face].z;
			uvs[2 * idx + 1] = (1 - uvs[2 * idx + 1]) * faceUV[face].y + uvs[2 * idx + 1] * faceUV[face].w;
			if (faceColors != null) {
				colors.push(faceColors[face].r);
				colors.push(faceColors[face].g);
				colors.push(faceColors[face].b);
				colors.push(faceColors[face].a);
			}
			
			index += 3;
		}
		
		// sides
		VertexData._ComputeSides(sideOrientation, positions, indices, normals, uvs, frontUVs, backUVs);
		
		// Result
		var vertexData = new VertexData();
		vertexData.indices = indices;
		vertexData.positions = positions;
		vertexData.normals = normals;
		vertexData.uvs = uvs;
		
		if (faceColors != null) {
			var totalColors = (sideOrientation == Mesh.DOUBLESIDE) ? colors.concat(colors) : colors;
			vertexData.colors = new Float32Array(totalColors);
		}
		
		return vertexData;		
	}
	
	public static function CreateIcoSphere(options:IcoSphereOptions):VertexData {
		var sideOrientation:Int = options.sideOrientation;
		var radius:Float = options.radius != null ? options.radius : 1;
		var flat:Bool = options.flat == null ? true : options.flat;
		var subdivisions:Int = options.subdivisions != null ? options.subdivisions : 4;
		var radiusX:Float = options.radiusX != null ? options.radiusX : radius;
		var radiusY:Float = options.radiusY != null ? options.radiusY : radius;
		var radiusZ:Float = options.radiusZ != null ? options.radiusZ : radius;
		
		var t = (1 + Math.sqrt(5)) / 2;
		
		// 12 vertex x,y,z
		var ico_vertices:Array<Float> = [
			-1, t, -0, 1, t, 0, -1, -t, 0, 1, -t, 0, // v0-3
			0, -1, -t, 0, 1, -t, 0, -1, t, 0, 1, t, // v4-7
			t, 0, 1, t, 0, -1, -t, 0, 1, -t, 0, -1  // v8-11
		];
		
		// index of 3 vertex makes a face of icopshere
		var ico_indices:Array<Int> = [
			0, 11, 5, 0, 5, 1, 0, 1, 7, 0, 7, 10, 0, 10, 11,
			1, 5, 9, 5, 11, 4, 11, 10, 2, 10, 7, 6, 7, 1, 8,
			3, 9, 4, 3, 4, 2, 3, 2, 6, 3, 6, 8, 3, 8, 9,
			4, 9, 5, 2, 4, 11, 6, 2, 10, 8, 6, 7, 9, 8, 1
		];
				
		// uv as integer step (not pixels !)
		var ico_vertexuv = [
			4, 1, 2, 1, 6, 3, 5, 4,
			4, 3, 3, 2, 7, 4, 3, 0,
			1, 0, 0, 1, 5, 0, 5, 2 // v8-11
		];
		
		// Vertices[0, 1, ...9, A, B] : position on UV plane
		// '+' indicate duplicate position to be fixed (3,9:0,2,3,4,7,8,A,B)
		// First island of uv mapping
		// v = 4h          3+  2
		// v = 3h        9+  4
		// v = 2h      9+  5   B
		// v = 1h    9   1   0
		// v = 0h  3   8   7   A
		//     u = 0 1 2 3 4 5 6  *a
		// uv step is u:1 or 0.5, v:cos(30)=sqrt(3)/2, ratio approx is 84/97
		var ustep:Float = 97 / 1024;
		var vstep:Float = 168 / 1024;
		var uoffset:Float = 50 / 1024;
		var voffset:Float = 51 / 1024;
				
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		
		var current_indice:Int = 0;
		// prepare array of 3 vector (empty) (to be worked in place, shared for each face)
		var face_vertex_pos:Array<Vector3> = [];
		var face_vertex_uv:Array<Vector2> = [];
		for (v012 in 0...3) {
			face_vertex_pos[v012] = Vector3.Zero();
			face_vertex_uv[v012] = Vector2.Zero();
		}
		
		// create all with normals
		for (face in 0...20) {
			// 3 vertex per face
			for (v012 in 0...3) {
				// look up vertex 0,1,2 to its index in 0 to 11
				var v_id = ico_indices[3 * face + v012];
				// vertex have 3D position (x,y,z)
				face_vertex_pos[v012].copyFromFloats(
					ico_vertices[3 * v_id],
					ico_vertices[3 * v_id + 1],
					ico_vertices[3 * v_id + 2]);
				// Normalize to get normal, then scale to radius
				face_vertex_pos[v012].normalize().scaleInPlace(radius);
				
				// uv from vertex ID (may need fix due to unwrap on texture plan, unalias needed)
				// vertex may get to different UV according to belonging face (see fix below)
				var fix:Int = 0;
				// Vertice 9 UV to be fixed
				if (face == 5 && v012 == 2) { fix = 1; }
				if (face == 15 && v012 == 1) { fix = 2; }
				if (face == 10 && v012 == 1) { fix = 3; }
				if (face == 14 && v012 == 2) { fix = 4; }
				// vertice 10 UV to be fixed
				if (face == 4 && v012 == 1) { fix = 1; }
				if (face == 7 && v012 == 1) { fix = 2; }
				if (face == 17 && v012 == 2) { fix = 3; }
				if (face == 8 && v012 == 0) { fix = 4; }
				// vertice 7 UV to be fixed
				if (face == 8 && v012 == 1) { fix = 5; }
				if (face == 18 && v012 == 0) { fix = 5; }
				// vertice 8 UV to be fixed
				if (face == 13 && v012 == 2) { fix = 5; }
				if (face == 14 && v012 == 1) { fix = 5; }
				if (face == 18 && v012 == 2) { fix = 5; }
				//
				face_vertex_uv[v012].copyFromFloats(
					(ico_vertexuv[2 * v_id] + fix) * ustep + uoffset,
					(ico_vertexuv[2 * v_id + 1] + fix) * vstep + voffset);
			}
			
			// Subdivide the face (interpolate pos, norm, uv)
			// - pos is linear interpolation, then projected to sphere (converge polyhedron to sphere)
			// - norm is linear interpolation of vertex corner normal
			//   (to be checked if better to re-calc from face vertex, or if approximation is OK ??? )
			// - uv is linear interpolation
			//
			// Topology is as below for sub-divide by 2
			// vertex shown as v0,v1,v2
			// interp index is i1 to progress in range [v0,v1[
			// interp index is i2 to progress in range [v0,v2[
			// face index as  (i1,i2)  for /\  : (i1,i2),(i1+1,i2),(i1,i2+1)
			//            and (i1,i2)' for \/  : (i1+1,i2),(i1+1,i2+1),(i1,i2+1)
			//
			//
			//                    i2    v2
			//                    ^    ^
			//                   /    / \
			//                  /    /   \
			//                 /    /     \
			//                /    / (0,1) \
			//               /    #---------\
			//              /    / \ (0,0)'/ \
			//             /    /   \     /   \
			//            /    /     \   /     \
			//           /    / (0,0) \ / (1,0) \
			//          /    #---------#---------\
			//              v0                    v1
			//
			//              --------------------> i1
			//
			// interp of (i1,i2):
			//  along i2 :  x0=lerp(v0,v2, i2/S) <---> x1=lerp(v1,v2, i2/S)
			//  along i1 :  lerp(x0,x1, i1/(S-i2))
			//
			// centroid of triangle is needed to get help normal computation
			//  (c1,c2) are used for centroid location

			var interp_vertex = function(i1:Float, i2:Float, c1:Float, c2:Float) {
				// vertex is interpolated from
				//   - face_vertex_pos[0..2]
				//   - face_vertex_uv[0..2]
				var pos_x0 = Vector3.Lerp(face_vertex_pos[0], face_vertex_pos[2], i2 / subdivisions);
				var pos_x1 = Vector3.Lerp(face_vertex_pos[1], face_vertex_pos[2], i2 / subdivisions);
				var pos_interp = (subdivisions == i2) ? face_vertex_pos[2] : Vector3.Lerp(pos_x0, pos_x1, i1 / (subdivisions - i2));
				pos_interp.normalize();
				pos_interp.x *= radiusX;
				pos_interp.y *= radiusY;
				pos_interp.z *= radiusZ;
				
				var vertex_normal:Vector3 = null;
				if (flat) {
					// in flat mode, recalculate normal as face centroid normal
					var centroid_x0 = Vector3.Lerp(face_vertex_pos[0], face_vertex_pos[2], c2 / subdivisions);
					var centroid_x1 = Vector3.Lerp(face_vertex_pos[1], face_vertex_pos[2], c2 / subdivisions);
					var centroid_interp = Vector3.Lerp(centroid_x0, centroid_x1, c1 / (subdivisions - c2));
					vertex_normal = Vector3.Normalize(centroid_interp);
				} 
				else {
					// in smooth mode, recalculate normal from each single vertex position
					vertex_normal = Vector3.Normalize(pos_interp);
				}
				
				var uv_x0 = Vector2.Lerp(face_vertex_uv[0], face_vertex_uv[2], i2 / subdivisions);
				var uv_x1 = Vector2.Lerp(face_vertex_uv[1], face_vertex_uv[2], i2 / subdivisions);
				var uv_interp = (subdivisions == i2) ? face_vertex_uv[2] : Vector2.Lerp(uv_x0, uv_x1, i1 / (subdivisions - i2));
				positions.push(pos_interp.x);
				positions.push(pos_interp.y);
				positions.push(pos_interp.z);
				normals.push(vertex_normal.x);
				normals.push(vertex_normal.y);
				normals.push(vertex_normal.z);
				uvs.push(uv_interp.x);
				uvs.push(uv_interp.y);
				// push each vertex has member of a face
				// Same vertex can bleong to multiple face, it is pushed multiple time (duplicate vertex are present)
				indices.push(current_indice);
				current_indice++;
			}
			
			for (i2 in 0...subdivisions) {
				var i1:Int = 0;
				while (i1 + i2 < subdivisions) {
					// face : (i1,i2)  for /\  :
					// interp for : (i1,i2),(i1+1,i2),(i1,i2+1)
					interp_vertex(i1, i2, i1 + 1.0 / 3, i2 + 1.0 / 3);
					interp_vertex(i1 + 1, i2, i1 + 1.0 / 3, i2 + 1.0 / 3);
					interp_vertex(i1, i2 + 1, i1 + 1.0 / 3, i2 + 1.0 / 3);
					if (i1 + i2 + 1 < subdivisions) {
						// face : (i1,i2)' for \/  :
						// interp for (i1+1,i2),(i1+1,i2+1),(i1,i2+1)
						interp_vertex(i1 + 1, i2, i1 + 2.0 / 3, i2 + 2.0 / 3);
						interp_vertex(i1 + 1, i2 + 1, i1 + 2.0 / 3, i2 + 2.0 / 3);
						interp_vertex(i1, i2 + 1, i1 + 2.0 / 3, i2 + 2.0 / 3);
					}
					
					++i1;
				}
			}
		}
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}
	
	// inspired by // http://stemkoski.github.io/Three.js/Polyhedra.html
	public static function CreatePolyhedron(options:Dynamic):VertexData {
		// provided polyhedron types :
		// 0 : Tetrahedron, 1 : Octahedron, 2 : Dodecahedron, 3 : Icosahedron, 4 : Rhombicuboctahedron, 5 : Triangular Prism, 6 : Pentagonal Prism, 7 : Hexagonal Prism, 8 : Square Pyramid (J1)
		// 9 : Pentagonal Pyramid (J2), 10 : Triangular Dipyramid (J12), 11 : Pentagonal Dipyramid (J13), 12 : Elongated Square Dipyramid (J15), 13 : Elongated Pentagonal Dipyramid (J16), 14 : Elongated Pentagonal Cupola (J20)
		var polyhedra:Array<Dynamic> = [];
		polyhedra[0] = { vertex: [[0, 0, 1.732051], [1.632993, 0, -0.5773503], [-0.8164966, 1.414214, -0.5773503], [-0.8164966, -1.414214, -0.5773503]], face: [[0, 1, 2], [0, 2, 3], [0, 3, 1], [1, 3, 2]] };

		polyhedra[1] = { vertex: [[0, 0, 1.414214], [1.414214, 0, 0], [0, 1.414214, 0], [ -1.414214, 0, 0], [0, -1.414214, 0], [0, 0, -1.414214]], face: [[0, 1, 2], [0, 2, 3], [0, 3, 4], [0, 4, 1], [1, 4, 5], [1, 5, 2], [2, 5, 3], [3, 5, 4]] };
		
		polyhedra[2] = { vertex: [[0, 0, 1.070466], [0.7136442, 0, 0.7978784], [-0.3568221, 0.618034, 0.7978784], [-0.3568221, -0.618034, 0.7978784], [0.7978784, 0.618034, 0.3568221], [0.7978784, -0.618034, 0.3568221], [-0.9341724, 0.381966, 0.3568221], [0.1362939, 1, 0.3568221], [0.1362939, -1, 0.3568221], [-0.9341724, -0.381966, 0.3568221], [0.9341724, 0.381966, -0.3568221], [0.9341724, -0.381966, -0.3568221], [-0.7978784, 0.618034, -0.3568221], [-0.1362939, 1, -0.3568221], [-0.1362939, -1, -0.3568221], [-0.7978784, -0.618034, -0.3568221], [0.3568221, 0.618034, -0.7978784], [0.3568221, -0.618034, -0.7978784], [-0.7136442, 0, -0.7978784], [0, 0, -1.070466]], face: [[0, 1, 4, 7, 2], [0, 2, 6, 9, 3], [0, 3, 8, 5, 1], [1, 5, 11, 10, 4], [2, 7, 13, 12, 6], [3, 9, 15, 14, 8], [4, 10, 16, 13, 7], [5, 8, 14, 17, 11], [6, 12, 18, 15, 9], [10, 11, 17, 19, 16], [12, 13, 16, 19, 18], [14, 15, 18, 19, 17]] };
		
		polyhedra[3] = { vertex: [[0, 0, 1.175571], [1.051462, 0, 0.5257311], [0.3249197, 1, 0.5257311], [-0.8506508, 0.618034, 0.5257311], [-0.8506508, -0.618034, 0.5257311], [0.3249197, -1, 0.5257311], [0.8506508, 0.618034, -0.5257311], [0.8506508, -0.618034, -0.5257311], [-0.3249197, 1, -0.5257311], [-1.051462, 0, -0.5257311], [-0.3249197, -1, -0.5257311], [0, 0, -1.175571]], face: [[0, 1, 2], [0, 2, 3], [0, 3, 4], [0, 4, 5], [0, 5, 1], [1, 5, 7], [1, 7, 6], [1, 6, 2], [2, 6, 8], [2, 8, 3], [3, 8, 9], [3, 9, 4], [4, 9, 10], [4, 10, 5], [5, 10, 7], [6, 7, 11], [6, 11, 8], [7, 10, 11], [8, 11, 9], [9, 11, 10]] };
		
		polyhedra[4] = { vertex: [[0, 0, 1.070722], [0.7148135, 0, 0.7971752], [-0.104682, 0.7071068, 0.7971752], [-0.6841528, 0.2071068, 0.7971752], [-0.104682, -0.7071068, 0.7971752], [0.6101315, 0.7071068, 0.5236279], [1.04156, 0.2071068, 0.1367736], [0.6101315, -0.7071068, 0.5236279], [-0.3574067, 1, 0.1367736], [-0.7888348, -0.5, 0.5236279], [-0.9368776, 0.5, 0.1367736], [-0.3574067, -1, 0.1367736], [0.3574067, 1, -0.1367736], [0.9368776, -0.5, -0.1367736], [0.7888348, 0.5, -0.5236279], [0.3574067, -1, -0.1367736], [-0.6101315, 0.7071068, -0.5236279], [-1.04156, -0.2071068, -0.1367736], [-0.6101315, -0.7071068, -0.5236279], [0.104682, 0.7071068, -0.7971752], [0.6841528, -0.2071068, -0.7971752], [0.104682, -0.7071068, -0.7971752], [-0.7148135, 0, -0.7971752], [0, 0, -1.070722]], face: [[0, 2, 3], [1, 6, 5], [4, 9, 11], [7, 15, 13], [8, 16, 10], [12, 14, 19], [17, 22, 18], [20, 21, 23], [0, 1, 5, 2], [0, 3, 9, 4], [0, 4, 7, 1], [1, 7, 13, 6], [2, 5, 12, 8], [2, 8, 10, 3], [3, 10, 17, 9], [4, 11, 15, 7], [5, 6, 14, 12], [6, 13, 20, 14], [8, 12, 19, 16], [9, 17, 18, 11], [10, 16, 22, 17], [11, 18, 21, 15], [13, 15, 21, 20], [14, 20, 23, 19], [16, 19, 23, 22], [18, 22, 23, 21]] };
		
		polyhedra[5] = { vertex: [[0, 0, 1.322876], [1.309307, 0, 0.1889822], [ -0.9819805, 0.8660254, 0.1889822], [0.1636634, -1.299038, 0.1889822], [0.3273268, 0.8660254, -0.9449112], [ -0.8183171, -0.4330127, -0.9449112]], face: [[0, 3, 1], [2, 4, 5], [0, 1, 4, 2], [0, 2, 5, 3], [1, 3, 5, 4]] };
		
		polyhedra[6] = { vertex: [[0, 0, 1.159953], [1.013464, 0, 0.5642542], [ -0.3501431, 0.9510565, 0.5642542], [ -0.7715208, -0.6571639, 0.5642542], [0.6633206, 0.9510565, -0.03144481], [0.8682979, -0.6571639, -0.3996071], [ -1.121664, 0.2938926, -0.03144481], [ -0.2348831, -1.063314, -0.3996071], [0.5181548, 0.2938926, -0.9953061], [ -0.5850262, -0.112257, -0.9953061]], face: [[0, 1, 4, 2], [0, 2, 6, 3], [1, 5, 8, 4], [3, 6, 9, 7], [5, 7, 9, 8], [0, 3, 7, 5, 1], [2, 4, 8, 9, 6]] };
		
		polyhedra[7] = { vertex: [[0, 0, 1.118034], [0.8944272, 0, 0.6708204], [ -0.2236068, 0.8660254, 0.6708204], [ -0.7826238, -0.4330127, 0.6708204], [0.6708204, 0.8660254, 0.2236068], [1.006231, -0.4330127, -0.2236068], [ -1.006231, 0.4330127, 0.2236068], [ -0.6708204, -0.8660254, -0.2236068], [0.7826238, 0.4330127, -0.6708204], [0.2236068, -0.8660254, -0.6708204], [ -0.8944272, 0, -0.6708204], [0, 0, -1.118034]], face: [[0, 1, 4, 2], [0, 2, 6, 3], [1, 5, 8, 4], [3, 6, 10, 7], [5, 9, 11, 8], [7, 10, 11, 9], [0, 3, 7, 9, 5, 1], [2, 4, 8, 11, 10, 6]] };
		
		polyhedra[8] = { vertex: [[ -0.729665, 0.670121, 0.319155], [ -0.655235, -0.29213, -0.754096], [ -0.093922, -0.607123, 0.537818], [0.702196, 0.595691, 0.485187], [0.776626, -0.36656, -0.588064]], face: [[1, 4, 2], [0, 1, 2], [3, 0, 2], [4, 3, 2], [4, 1, 0, 3]] };
		
		polyhedra[9] = { vertex: [[ -0.868849, -0.100041, 0.61257], [ -0.329458, 0.976099, 0.28078], [ -0.26629, -0.013796, -0.477654], [ -0.13392, -1.034115, 0.229829], [0.738834, 0.707117, -0.307018], [0.859683, -0.535264, -0.338508]], face: [[3, 0, 2], [5, 3, 2], [4, 5, 2], [1, 4, 2], [0, 1, 2], [0, 3, 5, 4, 1]] };
		
		polyhedra[10] = { vertex: [[ -0.610389, 0.243975, 0.531213], [ -0.187812, -0.48795, -0.664016], [ -0.187812, 0.9759, -0.664016], [0.187812, -0.9759, 0.664016], [0.798201, 0.243975, 0.132803]], face: [[1, 3, 0], [3, 4, 0], [3, 1, 4], [0, 2, 1], [0, 4, 2], [2, 4, 1]] };
		
		polyhedra[11] = { vertex: [[ -1.028778, 0.392027, -0.048786], [ -0.640503, -0.646161, 0.621837], [ -0.125162, -0.395663, -0.540059], [0.004683, 0.888447, -0.651988], [0.125161, 0.395663, 0.540059], [0.632925, -0.791376, 0.433102], [1.031672, 0.157063, -0.354165]], face: [[3, 2, 0], [2, 1, 0], [2, 5, 1], [0, 4, 3], [0, 1, 4], [4, 1, 5], [2, 3, 6], [3, 4, 6], [5, 2, 6], [4, 5, 6]] };
		
		polyhedra[12] = { vertex: [[ -0.669867, 0.334933, -0.529576], [ -0.669867, 0.334933, 0.529577], [ -0.4043, 1.212901, 0], [ -0.334933, -0.669867, -0.529576], [ -0.334933, -0.669867, 0.529577], [0.334933, 0.669867, -0.529576], [0.334933, 0.669867, 0.529577], [0.4043, -1.212901, 0], [0.669867, -0.334933, -0.529576], [0.669867, -0.334933, 0.529577]], face: [[8, 9, 7], [6, 5, 2], [3, 8, 7], [5, 0, 2], [4, 3, 7], [0, 1, 2], [9, 4, 7], [1, 6, 2], [9, 8, 5, 6], [8, 3, 0, 5], [3, 4, 1, 0], [4, 9, 6, 1]] };
		
		polyhedra[13] = { vertex: [[ -0.931836, 0.219976, -0.264632], [ -0.636706, 0.318353, 0.692816], [ -0.613483, -0.735083, -0.264632], [ -0.326545, 0.979634, 0], [ -0.318353, -0.636706, 0.692816], [ -0.159176, 0.477529, -0.856368], [0.159176, -0.477529, -0.856368], [0.318353, 0.636706, 0.692816], [0.326545, -0.979634, 0], [0.613482, 0.735082, -0.264632], [0.636706, -0.318353, 0.692816], [0.931835, -0.219977, -0.264632]], face: [[11, 10, 8], [7, 9, 3], [6, 11, 8], [9, 5, 3], [2, 6, 8], [5, 0, 3], [4, 2, 8], [0, 1, 3], [10, 4, 8], [1, 7, 3], [10, 11, 9, 7], [11, 6, 5, 9], [6, 2, 0, 5], [2, 4, 1, 0], [4, 10, 7, 1]] };
		
		polyhedra[14] = { vertex: [[-0.93465, 0.300459, -0.271185], [-0.838689, -0.260219, -0.516017], [-0.711319, 0.717591, 0.128359], [-0.710334, -0.156922, 0.080946], [-0.599799, 0.556003, -0.725148], [-0.503838, -0.004675, -0.969981], [-0.487004, 0.26021, 0.48049], [-0.460089, -0.750282, -0.512622], [-0.376468, 0.973135, -0.325605], [-0.331735, -0.646985, 0.084342], [-0.254001, 0.831847, 0.530001], [-0.125239, -0.494738, -0.966586], [0.029622, 0.027949, 0.730817], [0.056536, -0.982543, -0.262295], [0.08085, 1.087391, 0.076037], [0.125583, -0.532729, 0.485984], [0.262625, 0.599586, 0.780328], [0.391387, -0.726999, -0.716259], [0.513854, -0.868287, 0.139347], [0.597475, 0.85513, 0.326364], [0.641224, 0.109523, 0.783723], [0.737185, -0.451155, 0.538891], [0.848705, -0.612742, -0.314616], [0.976075, 0.365067, 0.32976], [1.072036, -0.19561, 0.084927]], face: [[15, 18, 21], [12, 20, 16], [6, 10, 2], [3, 0, 1], [9, 7, 13], [2, 8, 4, 0], [0, 4, 5, 1], [1, 5, 11, 7], [7, 11, 17, 13], [13, 17, 22, 18], [18, 22, 24, 21], [21, 24, 23, 20], [20, 23, 19, 16], [16, 19, 14, 10], [10, 14, 8, 2], [15, 9, 13, 18], [12, 15, 21, 20], [6, 12, 16, 10], [3, 6, 2, 0], [9, 3, 1, 7], [9, 15, 12, 6, 3], [22, 17, 11, 5, 4, 8, 14, 19, 23, 24]] };
		
		var type:Int = options.type != null ? options.type : 0;
		if (type < 0) {
			type = 0;
		}
		if (type >= polyhedra.length) {
			type = polyhedra.length - 1;
		}
		var size = options.size != null ? options.size : 1;
		var sizeX = options.sizeX != null ? options.sizeX : size;
		var sizeY = options.sizeY != null ? options.sizeY : size;
		var sizeZ = options.sizeZ != null ? options.sizeZ : size;
		var data:Dynamic = options.custom != null ? options.custom : polyhedra[type];
		var nbfaces:Int = data.face.length;
		var faceUV:Array<Vector4> = options.faceUV != null ? options.faceUV : [];
		var faceColors:Array<Color4> = options.faceColors != null ? options.faceColors : [];
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		var positions:Array<Float> = [];
		var indices:Array<Int> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
		var colors:Array<Float> = [];
		var index:Int = 0;
		var faceIdx:Int = 0;  // face cursor in the array "indexes"
		var indexes:Array<Int> = [];
		var u:Float = 0;
		var v:Float = 0;
		var ang:Float = 0;
		var x:Float = 0;
		var y:Float = 0;
		var tmp:Float = 0;
		
		// default face colors and UV if undefined
		for (f in 0...nbfaces) {
			if (faceColors != null && faceColors[f] == null) {
				faceColors[f] = new Color4(1, 1, 1, 1);
			}
			if (faceUV != null && faceUV[f] == null) {
				faceUV[f] = new Vector4(0, 0, 1, 1);
			}
		}

		for (f in 0...nbfaces) {
			var fl:Int = data.face[f].length;  // number of vertices of the current face
			ang = 2 * Math.PI / fl;
			x = 0.5 * Math.tan(ang / 2);
			y = 0.5;
			
			// positions, uvs, colors
			for (i in 0...fl) {
				// positions
				positions.push(data.vertex[data.face[f][i]][0] * sizeX);
				positions.push(data.vertex[data.face[f][i]][1] * sizeY);
				positions.push(data.vertex[data.face[f][i]][2] * sizeZ);
				indexes.push(index);
				index++;
				// uvs
				u = faceUV[f].x + (faceUV[f].z - faceUV[f].x) * (0.5 + x);
				v = faceUV[f].y + (faceUV[f].w - faceUV[f].y) * (y - 0.5);
				uvs.push(u);
				uvs.push(v);
				tmp = x * Math.cos(ang) - y * Math.sin(ang);
				y = x * Math.sin(ang) + y * Math.cos(ang);
				x = tmp;
				// colors
				if (faceColors[f] != null) {
					colors.push(faceColors[f].r);
					colors.push(faceColors[f].g);
					colors.push(faceColors[f].b);
					colors.push(faceColors[f].a);
				}
			}
			
			// indices from indexes
			for (i in 0...fl - 2) {
				indices.push(indexes[0 + faceIdx]);
				indices.push(indexes[i + 2 + faceIdx]);
				indices.push(indexes[i + 1 + faceIdx]);
			}
			faceIdx += fl;
		}
		
		VertexData.ComputeNormals(positions, indices, normals);
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		if (faceColors.length > 0) {
			vertexData.colors = new Float32Array(colors);
		}
		
		return vertexData;
	}

	// based on http://code.google.com/p/away3d/source/browse/trunk/fp10/Away3D/src/away3d/primitives/TorusKnot.as?spec=svn2473&r=2473
	public static function CreateTorusKnot(options:Dynamic):VertexData {
		var indices:Array<Int> = [];
		var positions:Array<Float> = [];
		var normals:Array<Float> = [];
		var uvs:Array<Float> = [];
				
		var radius:Float = options.radius != null ? options.radius : 2;
		var tube:Float = options.tube != null ? options.tube : 0.5;
		var radialSegments:Int = options.radialSegments != null ? options.radialSegments : 32;
		var tubularSegments:Int = options.tubularSegments != null ? options.tubularSegments : 32;
		var p:Float = options.p != null ? options.p : 2;
		var q:Float = options.q != null ? options.q : 3;
		var sideOrientation:Int = options.sideOrientation != null ? options.sideOrientation : Mesh.DEFAULTSIDE;
		
		// Helper
		var getPos = function(angle:Float):Vector3 {
			
			var cu = Math.cos(angle);
			var su = Math.sin(angle);
			var quOverP = q / p * angle;
			var cs = Math.cos(quOverP);
			
			var tx = radius * (2 + cs) * 0.5 * cu;
			var ty = radius * (2 + cs) * su * 0.5;
			var tz = radius * Math.sin(quOverP) * 0.5;
			
			return new Vector3(tx, ty, tz);
		};
		
		// Vertices
		for (i in 0...radialSegments + 1) {
			var modI = i % radialSegments;
			var u = modI / radialSegments * 2 * p * Math.PI;
			var p1 = getPos(u);
			var p2 = getPos(u + 0.01);
			var tang = p2.subtract(p1);
			var n = p2.add(p1);
			
			var bitan = Vector3.Cross(tang, n);
			n = Vector3.Cross(bitan, tang);
			
			bitan.normalize();
			n.normalize();
			
			for (j in 0...tubularSegments) {
				var modJ = j % tubularSegments;
				var v = modJ / tubularSegments * 2 * Math.PI;
				var cx = -tube * Math.cos(v);
				var cy = tube * Math.sin(v);
				
				positions.push(p1.x + cx * n.x + cy * bitan.x);
				positions.push(p1.y + cx * n.y + cy * bitan.y);
				positions.push(p1.z + cx * n.z + cy * bitan.z);
				
				uvs.push(i / radialSegments);
				uvs.push(j / tubularSegments);
			}
		}
		
		for (i in 0...radialSegments) {
			for (j in 0...tubularSegments) {
				var jNext = (j + 1) % tubularSegments;
				var a = i * tubularSegments + j;
				var b = (i + 1) * tubularSegments + j;
				var c = (i + 1) * tubularSegments + jNext;
				var d = i * tubularSegments + jNext;
				
				indices.push(d); indices.push(b); indices.push(a);
				indices.push(d); indices.push(c); indices.push(b);
			}
		}
		
		// Normals
		VertexData.ComputeNormals(positions, indices, normals);
		
		var _positions = new Float32Array(positions);
		var _indices = new Int32Array(indices);
		var _normals = new Float32Array(normals);
		var _uvs = new Float32Array(uvs);
		
		// sides
		VertexData._ComputeSides(sideOrientation, _positions, _indices, _normals, _uvs);
		
		// Result
		var vertexData = new VertexData();
		
		vertexData.indices = _indices;
		vertexData.positions = _positions;
		vertexData.normals = _normals;
		vertexData.uvs = _uvs;
		
		return vertexData;
	}

	// Tools
	/**
	 * @param {any} - positions (number[] or Float32Array)
	 * @param {any} - indices   (number[] or Uint16Array)
	 * @param {any} - normals   (number[] or Float32Array)
	 */
	public static function ComputeNormals(positions:Dynamic, indices:Dynamic, normals:Dynamic, ?options:Dynamic) {
		// temporary scalar variables
		var index = 0;                      // facet index     
		var p1p2x = 0.0;                    // p1p2 vector x coordinate
		var p1p2y = 0.0;                    // p1p2 vector y coordinate
		var p1p2z = 0.0;                    // p1p2 vector z coordinate
		var p3p2x = 0.0;                    // p3p2 vector x coordinate
		var p3p2y = 0.0;                    // p3p2 vector y coordinate
		var p3p2z = 0.0;                    // p3p2 vector z coordinate
		var faceNormalx = 0.0;              // facet normal x coordinate
		var faceNormaly = 0.0;              // facet normal y coordinate
		var faceNormalz = 0.0;              // facet normal z coordinate
		var length = 0.0;                   // facet normal length before normalization
		var v1x = 0;                        // vector1 x index in the positions array
		var v1y = 0;                        // vector1 y index in the positions array
		var v1z = 0;                        // vector1 z index in the positions array
		var v2x = 0;                        // vector2 x index in the positions array
		var v2y = 0;                        // vector2 y index in the positions array
		var v2z = 0;                        // vector2 z index in the positions array
		var v3x = 0;                        // vector3 x index in the positions array
		var v3y = 0;                        // vector3 y index in the positions array
		var v3z = 0;                        // vector3 z index in the positions array
		var computeFacetNormals = false;
		var computeFacetPositions = false;
		var computeFacetPartitioning = false;
		var faceNormalSign = 1;
		if (options != null) {
			computeFacetNormals = (options.facetNormals == true) ? true : false;
			computeFacetPositions = (options.facetPositions == true) ? true : false;
			computeFacetPartitioning = (options.facetPartitioning == true) ? true : false;
			faceNormalSign = (options.useRightHandedSystem == true) ? -1 : 1;
		}
		
		var ox = 0;                 // X partitioning index for facet position
		var oy = 0;                 // Y partinioning index for facet position
		var oz = 0;                 // Z partinioning index for facet position
		var b1x = 0;                // X partitioning index for facet v1 vertex
		var b1y = 0;                // Y partitioning index for facet v1 vertex
		var b1z = 0;                // z partitioning index for facet v1 vertex
		var b2x = 0;                // X partitioning index for facet v2 vertex
		var b2y = 0;                // Y partitioning index for facet v2 vertex
		var b2z = 0;                // Z partitioning index for facet v2 vertex
		var b3x = 0;                // X partitioning index for facet v3 vertex
		var b3y = 0;                // Y partitioning index for facet v3 vertex
		var b3z = 0;                // Z partitioning index for facet v3 vertex
		var block_idx_o = 0;        // facet barycenter block index
		var block_idx_v1 = 0;       // v1 vertex block index
		var block_idx_v2 = 0;       // v2 vertex block index
		var block_idx_v3 = 0;       // v3 vertex block index
		
		var bbSizeMax:Float = 0;
		var xSubRatio:Float = 0;
		var ySubRatio:Float = 0;
		var zSubRatio:Float = 0;
		var subSq:Float = 0;
		
		// facetPartitioning reinit if needed
		if (computeFacetPartitioning) {			
			bbSizeMax = (options.bbSize.x > options.bbSize.y) ? options.bbSize.x : options.bbSize.y;
			bbSizeMax = (bbSizeMax > options.bbSize.z) ? bbSizeMax : options.bbSize.z;
			xSubRatio = options.subDiv.X * options.ratio / options.bbSize.x;
			ySubRatio = options.subDiv.Y * options.ratio / options.bbSize.y;
			zSubRatio = options.subDiv.Z * options.ratio / options.bbSize.z;
			subSq = options.subDiv.max * options.subDiv.max;
			options.facetPartitioning.length = 0;
		}
		
		// reset the normals
		for (index in 0...positions.length) {
			normals[index] = 0.0;
		}
		
		// Loop : 1 indice triplet = 1 facet
		var nbFaces = Std.int(indices.length / 3);
		for (index in 0...nbFaces) {
			// get the indexes of the coordinates of each vertex of the facet
			v1x = Std.int(indices[index * 3] * 3);
			v1y = v1x + 1;
			v1z = v1x + 2;
			v2x = Std.int(indices[index * 3 + 1] * 3);
			v2y = v2x + 1;
			v2z = v2x + 2;
			v3x = Std.int(indices[index * 3 + 2] * 3);
			v3y = v3x + 1;
			v3z = v3x + 2;
			
			p1p2x = positions[v1x] - positions[v2x];          // compute two vectors per facet : p1p2 and p3p2
			p1p2y = positions[v1y] - positions[v2y];
			p1p2z = positions[v1z] - positions[v2z];
			
			p3p2x = positions[v3x] - positions[v2x];
			p3p2y = positions[v3y] - positions[v2y];
			p3p2z = positions[v3z] - positions[v2z];
			
			// compute the face normal with the cross product
			faceNormalx = faceNormalSign * (p1p2y * p3p2z - p1p2z * p3p2y);
			faceNormaly = faceNormalSign * (p1p2z * p3p2x - p1p2x * p3p2z);
			faceNormalz = faceNormalSign * (p1p2x * p3p2y - p1p2y * p3p2x);
			// normalize this normal and store it in the array facetData
			length = Math.sqrt(faceNormalx * faceNormalx + faceNormaly * faceNormaly + faceNormalz * faceNormalz);
			length = (length == 0) ? 1.0 : length;
			faceNormalx /= length;
			faceNormaly /= length;
			faceNormalz /= length;
			
			if (computeFacetNormals) {
				options.facetNormals[index].x = faceNormalx;
				options.facetNormals[index].y = faceNormaly;
				options.facetNormals[index].z = faceNormalz;
			}
			
			if (computeFacetPositions) {
				// compute and the facet barycenter coordinates in the array facetPositions 
				options.facetPositions[index].x = (positions[v1x] + positions[v2x] + positions[v3x]) / 3.0;
				options.facetPositions[index].y = (positions[v1y] + positions[v2y] + positions[v3y]) / 3.0;
				options.facetPositions[index].z = (positions[v1z] + positions[v2z] + positions[v3z]) / 3.0;
			}
			
			if (computeFacetPartitioning) {
				// store the facet indexes in arrays in the main facetPartitioning array :
				// compute each facet vertex (+ facet barycenter) index in the partiniong array
				ox = Math.floor((options.facetPositions[index].x - options.bInfo.minimum.x * options.ratio) * xSubRatio);
				oy = Math.floor((options.facetPositions[index].y - options.bInfo.minimum.y * options.ratio) * ySubRatio);
				oz = Math.floor((options.facetPositions[index].z - options.bInfo.minimum.z * options.ratio) * zSubRatio);
				b1x = Math.floor((positions[v1x] - options.bInfo.minimum.x * options.ratio) * xSubRatio);
				b1y = Math.floor((positions[v1y] - options.bInfo.minimum.y * options.ratio) * ySubRatio);
				b1z = Math.floor((positions[v1z] - options.bInfo.minimum.z * options.ratio) * zSubRatio);
				b2x = Math.floor((positions[v2x] - options.bInfo.minimum.x * options.ratio) * xSubRatio);
				b2y = Math.floor((positions[v2y] - options.bInfo.minimum.y * options.ratio) * ySubRatio);
				b2z = Math.floor((positions[v2z] - options.bInfo.minimum.z * options.ratio) * zSubRatio);
				b3x = Math.floor((positions[v3x] - options.bInfo.minimum.x * options.ratio) * xSubRatio);
				b3y = Math.floor((positions[v3y] - options.bInfo.minimum.y * options.ratio) * ySubRatio);
				b3z = Math.floor((positions[v3z] - options.bInfo.minimum.z * options.ratio) * zSubRatio);
				
				block_idx_v1 = Std.int(b1x + options.subDiv.max * b1y + subSq * b1z);
				block_idx_v2 = Std.int(b2x + options.subDiv.max * b2y + subSq * b2z);
				block_idx_v3 = Std.int(b3x + options.subDiv.max * b3y + subSq * b3z);
				block_idx_o = Std.int(ox + options.subDiv.max * oy + subSq * oz);
				
				options.facetPartitioning[block_idx_o] = options.facetPartitioning[block_idx_o] ? options.facetPartitioning[block_idx_o] : [];
				options.facetPartitioning[block_idx_v1] = options.facetPartitioning[block_idx_v1] ? options.facetPartitioning[block_idx_v1] : [];
				options.facetPartitioning[block_idx_v2] = options.facetPartitioning[block_idx_v2] ? options.facetPartitioning[block_idx_v2] : [];
				options.facetPartitioning[block_idx_v3] = options.facetPartitioning[block_idx_v3] ? options.facetPartitioning[block_idx_v3] : [];
				
				// push each facet index in each block containing the vertex
				options.facetPartitioning[block_idx_v1].push(index);
				if (block_idx_v2 != block_idx_v1) {
					options.facetPartitioning[block_idx_v2].push(index);
				}
				if (!(block_idx_v3 == block_idx_v2 || block_idx_v3 == block_idx_v1)) {
					options.facetPartitioning[block_idx_v3].push(index);
				}
				if (!(block_idx_o == block_idx_v1 || block_idx_o == block_idx_v2 || block_idx_o == block_idx_v3)) {
					options.facetPartitioning[block_idx_o].push(index);
				}
			}
			
			// compute the normals anyway
			normals[v1x] += faceNormalx;                         // accumulate all the normals per face
			normals[v1y] += faceNormaly;
			normals[v1z] += faceNormalz;
			normals[v2x] += faceNormalx;
			normals[v2y] += faceNormaly;
			normals[v2z] += faceNormalz;
			normals[v3x] += faceNormalx;
			normals[v3y] += faceNormaly;
			normals[v3z] += faceNormalz;
		}
		// last normalization of each normal
		for (index in 0...Std.int(normals.length / 3)) {
			faceNormalx = normals[index * 3];
			faceNormaly = normals[index * 3 + 1];
			faceNormalz = normals[index * 3 + 2];
			
			length = Math.sqrt(faceNormalx * faceNormalx + faceNormaly * faceNormaly + faceNormalz * faceNormalz);
			length = (length == 0) ? 1.0 : length;
			faceNormalx /= length;
			faceNormaly /= length;
			faceNormalz /= length;
			
			normals[index * 3] = faceNormalx;
			normals[index * 3 + 1] = faceNormaly;
			normals[index * 3 + 2] = faceNormalz;
		}
	}
	
	public static function _ComputeSides(sideOrientation:Int = Mesh.DEFAULTSIDE, positions:Float32Array, indices:Int32Array, normals:Float32Array, uvs:Float32Array, ?frontUVs:Vector4, ?backUVs:Vector4) {
		var li:Int = indices.length;
		var ln:Int = normals.length;
		
		switch (sideOrientation) {			
			case Mesh.FRONTSIDE:
				// nothing changed
				
			case Mesh.BACKSIDE:
				var tmp:Int = 0;
				// indices
				var i:Int = 0;
				while(i < li) {
					tmp = indices[i];
					indices[i] = indices[i + 2];
					indices[i + 2] = tmp;
					i += 3;
				}
				// normals
				for (n in 0...ln) {
					normals[n] = -normals[n];
				}
				
			case Mesh.DOUBLESIDE:
				// positions 
				var lp:Int = positions.length;
				var l:Int = Std.int(lp / 3);
				for (p in 0...lp) {
					positions[lp + p] = positions[p];
				}
				// indices
				var i:Int = 0;
				while (i < li) {
					indices[i + li] = indices[i + 2] + l;
					indices[i + 1 + li] = indices[i + 1] + l;
					indices[i + 2 + li] = indices[i] + l;
					i += 3;
				}
				// normals
				for (n in 0...ln) {
					normals[ln + n] = -normals[n];
				}
				
				// uvs
				var lu:Int = uvs.length;
				var u:Int = 0;
				for (u in 0...lu) {
					uvs[u + lu] = uvs[u];                       
				}
				var frontUVs = frontUVs != null ? frontUVs : new Vector4(0.0, 0.0, 1.0, 1.0);
				var backUVs = backUVs != null ? backUVs : new Vector4(0.0, 0.0, 1.0, 1.0); 
				u = 0;
				for (i in 0...Std.int(lu / 2)) {    
					uvs[u] = frontUVs.x + (frontUVs.z - frontUVs.x) * uvs[u];
					uvs[u + 1] = frontUVs.y + (frontUVs.w - frontUVs.y) * uvs[u + 1];
					uvs[u + lu] = backUVs.x + (backUVs.z - backUVs.x) * uvs[u + lu];
					uvs[u + lu + 1] = backUVs.y + (backUVs.w - backUVs.y) * uvs[u + lu + 1];
					u += 2;
				}
		}
	}
	
	public static function ImportVertexData(parsedVertexData:Dynamic, geometry:Geometry) {
		var vertexData = new VertexData();
		
		// positions
		var positions = parsedVertexData.positions;
		if (positions != null) {
			vertexData.set(positions, VertexBuffer.PositionKind);
		}
		
		// normals
		var normals = parsedVertexData.normals;
		if (normals != null) {
			vertexData.set(normals, VertexBuffer.NormalKind);
		}
		
		// tangents
		var tangents = parsedVertexData.tangents;
		if (tangents != null) {
			vertexData.set(tangents, VertexBuffer.TangentKind);
		}
		
		// uvs
		var uvs = parsedVertexData.uvs;
		if (uvs != null) {
			vertexData.set(uvs, VertexBuffer.UVKind);
		}
		
		// uv2s
		var uv2s = parsedVertexData.uv2s;
		if (uv2s != null) {
			vertexData.set(uv2s, VertexBuffer.UV2Kind);
		}
		
		// uv3s
		var uv3s = parsedVertexData.uv3s;
		if (uv3s != null) {
			vertexData.set(uv3s, VertexBuffer.UV3Kind);
		}
		
		// uv4s
		var uv4s = parsedVertexData.uv4s;
		if (uv4s != null) {
			vertexData.set(uv4s, VertexBuffer.UV4Kind);
		}
		
		// uv5s
		var uv5s = parsedVertexData.uv5s;
		if (uv5s != null) {
			vertexData.set(uv5s, VertexBuffer.UV5Kind);
		}
		
		// uv6s
		var uv6s = parsedVertexData.uv6s;
		if (uv6s != null) {
			vertexData.set(uv6s, VertexBuffer.UV6Kind);
		}
		
		// colors
		var colors = parsedVertexData.colors;
		if (colors != null) {
			vertexData.set(new Float32Array(Color4.CheckColors4(colors, Std.int(positions.length / 3))), VertexBuffer.ColorKind);
		}
		
		// matricesIndices
		var matricesIndices = parsedVertexData.matricesIndices;
		if (matricesIndices != null) {
			vertexData.set(matricesIndices, VertexBuffer.MatricesIndicesKind);
		}
		
		// matricesWeights
		var matricesWeights = parsedVertexData.matricesWeights;
		if (matricesWeights != null) {
			vertexData.set(matricesWeights, VertexBuffer.MatricesWeightsKind);
		}
		
		// indices
		var indices = parsedVertexData.indices;
		if (indices != null) {
			vertexData.indices = indices;
		}
		
		geometry.setAllVerticesData(vertexData, parsedVertexData.updatable);
	}
	
}
