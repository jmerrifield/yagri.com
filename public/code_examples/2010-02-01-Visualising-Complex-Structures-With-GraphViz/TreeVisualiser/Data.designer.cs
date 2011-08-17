﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4927
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TreeVisualiser
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="GraphVizDebugging")]
	public partial class DataDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertFieldSpec(FieldSpec instance);
    partial void UpdateFieldSpec(FieldSpec instance);
    partial void DeleteFieldSpec(FieldSpec instance);
    partial void InsertPredicate(Predicate instance);
    partial void UpdatePredicate(Predicate instance);
    partial void DeletePredicate(Predicate instance);
    #endregion
		
		public DataDataContext() : 
				base(global::TreeVisualiser.Properties.Settings.Default.GraphVizDebuggingConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DataDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<FieldSpec> FieldSpecs
		{
			get
			{
				return this.GetTable<FieldSpec>();
			}
		}
		
		public System.Data.Linq.Table<Predicate> Predicates
		{
			get
			{
				return this.GetTable<Predicate>();
			}
		}
	}
	
	[Table(Name="dbo.fieldspec")]
	public partial class FieldSpec : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _Id;
		
		private string _Name;
		
		private string _FieldType;
		
		private System.Nullable<bool> _IsRequired;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(System.Guid value);
    partial void OnIdChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnFieldTypeChanging(string value);
    partial void OnFieldTypeChanged();
    partial void OnIsRequiredChanging(System.Nullable<bool> value);
    partial void OnIsRequiredChanged();
    #endregion
		
		public FieldSpec()
		{
			OnCreated();
		}
		
		[Column(Name="id", Storage="_Id", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[Column(Name="name", Storage="_Name", DbType="NVarChar(100)")]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[Column(Name="field_type", Storage="_FieldType", DbType="NVarChar(200)")]
		public string FieldType
		{
			get
			{
				return this._FieldType;
			}
			set
			{
				if ((this._FieldType != value))
				{
					this.OnFieldTypeChanging(value);
					this.SendPropertyChanging();
					this._FieldType = value;
					this.SendPropertyChanged("FieldType");
					this.OnFieldTypeChanged();
				}
			}
		}
		
		[Column(Name="is_required", Storage="_IsRequired", DbType="Bit")]
		public System.Nullable<bool> IsRequired
		{
			get
			{
				return this._IsRequired;
			}
			set
			{
				if ((this._IsRequired != value))
				{
					this.OnIsRequiredChanging(value);
					this.SendPropertyChanging();
					this._IsRequired = value;
					this.SendPropertyChanged("IsRequired");
					this.OnIsRequiredChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[Table(Name="dbo.predicate")]
	[InheritanceMapping(Code="Or", Type=typeof(OrPredicate), IsDefault=true)]
	[InheritanceMapping(Code="And", Type=typeof(AndPredicate))]
	[InheritanceMapping(Code="Compare", Type=typeof(ComparePredicate))]
	[InheritanceMapping(Code="Root", Type=typeof(RootPredicate))]
	public abstract partial class Predicate : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _Id;
		
		private string _PredicateType = default(string);
		
		private bool _IsDeleted;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(System.Guid value);
    partial void OnIdChanged();
    partial void OnIsDeletedChanging(bool value);
    partial void OnIsDeletedChanged();
    #endregion
		
		public Predicate()
		{
			OnCreated();
		}
		
		[Column(Name="id", Storage="_Id", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[Column(Name="pred_type", Storage="_PredicateType", DbType="NVarChar(20)", UpdateCheck=UpdateCheck.Never, IsDiscriminator=true)]
		public string PredicateType
		{
			get
			{
				return this._PredicateType;
			}
		}
		
		[Column(Name="is_deleted", Storage="_IsDeleted", DbType="Bit")]
		public bool IsDeleted
		{
			get
			{
				return this._IsDeleted;
			}
			set
			{
				if ((this._IsDeleted != value))
				{
					this.OnIsDeletedChanging(value);
					this.SendPropertyChanging();
					this._IsDeleted = value;
					this.SendPropertyChanged("IsDeleted");
					this.OnIsDeletedChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	public abstract partial class CompoundPredicate : Predicate
	{
		
		private System.Nullable<System.Guid> _LeftChildId;
		
		private System.Nullable<System.Guid> _RightChildId;
		
		private EntityRef<Predicate> _LeftChild;
		
		private EntityRef<Predicate> _RightChild;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnLeftChildIdChanging(System.Nullable<System.Guid> value);
    partial void OnLeftChildIdChanged();
    partial void OnRightChildIdChanging(System.Nullable<System.Guid> value);
    partial void OnRightChildIdChanged();
    #endregion
		
		public CompoundPredicate()
		{
			this._LeftChild = default(EntityRef<Predicate>);
			this._RightChild = default(EntityRef<Predicate>);
			OnCreated();
		}
		
		[Column(Name="left_child_id", Storage="_LeftChildId", DbType="UniqueIdentifier")]
		protected System.Nullable<System.Guid> LeftChildId
		{
			get
			{
				return this._LeftChildId;
			}
			set
			{
				if ((this._LeftChildId != value))
				{
					this.OnLeftChildIdChanging(value);
					this.SendPropertyChanging();
					this._LeftChildId = value;
					this.SendPropertyChanged("LeftChildId");
					this.OnLeftChildIdChanged();
				}
			}
		}
		
		[Column(Name="right_child_id", Storage="_RightChildId", DbType="UniqueIdentifier")]
		protected System.Nullable<System.Guid> RightChildId
		{
			get
			{
				return this._RightChildId;
			}
			set
			{
				if ((this._RightChildId != value))
				{
					this.OnRightChildIdChanging(value);
					this.SendPropertyChanging();
					this._RightChildId = value;
					this.SendPropertyChanged("RightChildId");
					this.OnRightChildIdChanged();
				}
			}
		}
		
		[Association(Name="Predicate_CompoundPredicate", Storage="_LeftChild", ThisKey="LeftChildId", OtherKey="Id", IsForeignKey=true)]
		public Predicate LeftChild
		{
			get
			{
				return this._LeftChild.Entity;
			}
			set
			{
				if ((this._LeftChild.Entity != value))
				{
					this.SendPropertyChanging();
					this._LeftChild.Entity = value;
					this.SendPropertyChanged("LeftChild");
				}
			}
		}
		
		[Association(Name="Predicate_CompoundPredicate1", Storage="_RightChild", ThisKey="RightChildId", OtherKey="Id", IsForeignKey=true)]
		public Predicate RightChild
		{
			get
			{
				return this._RightChild.Entity;
			}
			set
			{
				if ((this._RightChild.Entity != value))
				{
					this.SendPropertyChanging();
					this._RightChild.Entity = value;
					this.SendPropertyChanged("RightChild");
				}
			}
		}
	}
	
	public partial class OrPredicate : CompoundPredicate
	{
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    #endregion
		
		public OrPredicate()
		{
			OnCreated();
		}
	}
	
	public partial class AndPredicate : CompoundPredicate
	{
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    #endregion
		
		public AndPredicate()
		{
			OnCreated();
		}
	}
	
	public partial class ComparePredicate : Predicate
	{
		
		private System.Nullable<System.Guid> _FieldSpecId;
		
		private string _CompareType;
		
		private string _MatchValue;
		
		private EntityRef<FieldSpec> _FieldSpec;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnFieldSpecIdChanging(System.Nullable<System.Guid> value);
    partial void OnFieldSpecIdChanged();
    partial void OnCompareTypeChanging(string value);
    partial void OnCompareTypeChanged();
    partial void OnMatchValueChanging(string value);
    partial void OnMatchValueChanged();
    #endregion
		
		public ComparePredicate()
		{
			this._FieldSpec = default(EntityRef<FieldSpec>);
			OnCreated();
		}
		
		[Column(Name="field_spec_id", Storage="_FieldSpecId", DbType="UniqueIdentifier")]
		protected System.Nullable<System.Guid> FieldSpecId
		{
			get
			{
				return this._FieldSpecId;
			}
			set
			{
				if ((this._FieldSpecId != value))
				{
					this.OnFieldSpecIdChanging(value);
					this.SendPropertyChanging();
					this._FieldSpecId = value;
					this.SendPropertyChanged("FieldSpecId");
					this.OnFieldSpecIdChanged();
				}
			}
		}
		
		[Column(Name="compare_type", Storage="_CompareType", DbType="NVarChar(100)")]
		public string CompareType
		{
			get
			{
				return this._CompareType;
			}
			set
			{
				if ((this._CompareType != value))
				{
					this.OnCompareTypeChanging(value);
					this.SendPropertyChanging();
					this._CompareType = value;
					this.SendPropertyChanged("CompareType");
					this.OnCompareTypeChanged();
				}
			}
		}
		
		[Column(Name="match_value", Storage="_MatchValue", DbType="NVarChar(4000)")]
		public string MatchValue
		{
			get
			{
				return this._MatchValue;
			}
			set
			{
				if ((this._MatchValue != value))
				{
					this.OnMatchValueChanging(value);
					this.SendPropertyChanging();
					this._MatchValue = value;
					this.SendPropertyChanged("MatchValue");
					this.OnMatchValueChanged();
				}
			}
		}
		
		[Association(Name="FieldSpec_ComparePredicate", Storage="_FieldSpec", ThisKey="FieldSpecId", OtherKey="Id", IsForeignKey=true)]
		public FieldSpec FieldSpec
		{
			get
			{
				return this._FieldSpec.Entity;
			}
			set
			{
				if ((this._FieldSpec.Entity != value))
				{
					this.SendPropertyChanging();
					this._FieldSpec.Entity = value;
					this.SendPropertyChanged("FieldSpec");
				}
			}
		}
	}
	
	public partial class RootPredicate : Predicate
	{
		
		private System.Nullable<System.Guid> _RootChildId;
		
		private EntityRef<Predicate> _RootChild;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnRootChildIdChanging(System.Nullable<System.Guid> value);
    partial void OnRootChildIdChanged();
    #endregion
		
		public RootPredicate()
		{
			this._RootChild = default(EntityRef<Predicate>);
			OnCreated();
		}
		
		[Column(Name="root_child_id", Storage="_RootChildId", DbType="UniqueIdentifier")]
		protected System.Nullable<System.Guid> RootChildId
		{
			get
			{
				return this._RootChildId;
			}
			set
			{
				if ((this._RootChildId != value))
				{
					this.OnRootChildIdChanging(value);
					this.SendPropertyChanging();
					this._RootChildId = value;
					this.SendPropertyChanged("RootChildId");
					this.OnRootChildIdChanged();
				}
			}
		}
		
		[Association(Name="Predicate_RootPredicate", Storage="_RootChild", ThisKey="RootChildId", OtherKey="Id", IsForeignKey=true)]
		public Predicate RootChild
		{
			get
			{
				return this._RootChild.Entity;
			}
			set
			{
				if ((this._RootChild.Entity != value))
				{
					this.SendPropertyChanging();
					this._RootChild.Entity = value;
					this.SendPropertyChanged("RootChild");
				}
			}
		}
	}
}
#pragma warning restore 1591
