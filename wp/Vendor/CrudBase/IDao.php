<?php
interface IDao{
	public function sqlExe($sql);
	public function begin();
	public function rollback();
	public function commit();
	public function getData($sql);
	public function getEnt($sql);
	public function getValue($sql);
}