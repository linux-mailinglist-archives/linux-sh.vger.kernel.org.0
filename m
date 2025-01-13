Return-Path: <linux-sh+bounces-2294-lists+linux-sh=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C6A0ADE0
	for <lists+linux-sh@lfdr.de>; Mon, 13 Jan 2025 04:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E08A1886602
	for <lists+linux-sh@lfdr.de>; Mon, 13 Jan 2025 03:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5961F146A60;
	Mon, 13 Jan 2025 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSRWhzay"
X-Original-To: linux-sh@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246F1420DD;
	Mon, 13 Jan 2025 03:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736738745; cv=none; b=qyUNzz/5awqBpGs9fC6mrLNQvNUJzrp1MLP3K8dUn6HGWXirM7QUVGhduAy8ugl1LQEGi6WcdcJ/pIXT8Z16WmWojABxDSKCvjukUjA0TqmDqC78rQZjv0ZwTPo7RIcVePUvUT2h5DqE5Io9HtpafnWkG18NtbhN7zq7layku3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736738745; c=relaxed/simple;
	bh=kDvnC74Lo6EZ1n3L3aZwXkWsD4GwjpMEPT/wHL2YzN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Polb2I9JXmwgvdRR0sZs8qULzCINJuQHOPCD0EzeQJCt1GPpFn4q/90VCq2rHjCVCRVUjIymjEEj7uyGnAQWN8SsvZsplb9IUCWsWZoS/sHpAFVleCxsuhw8Xj9SunIVHIuhwn+Ndup3hcKNKB/Xti+h6Gr4w8RZ3RQQs45qQPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSRWhzay; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736738743; x=1768274743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDvnC74Lo6EZ1n3L3aZwXkWsD4GwjpMEPT/wHL2YzN4=;
  b=bSRWhzayo+3BVU64Q2ou3pz2apkIzEWoisoV91Qya9Dv09XZmkWO/loo
   2EOfrujz+Zg0JRVHHy6damYgkMU5cge7KpddDJJvTixfEdEpGaWAUGrfl
   VnpkHLSrofMoJiN7mH04FGsk11WeOXdJARfZy6s1RR4/BvEa4Vu57oSpi
   QNpWL+Idd9ihCWUZv1q8qjioGGa9eqR6/r+bohc1PhCK4xbXc1+2uDxZ4
   U4MgPyvPsn0a8w+LaAd8OjdRRvznJjor4mYHd0cb7EYBrYIrQTItzev8t
   1lLhHIH7ybbULgeE7G6eERgNLhatQp49PzHiyYkILyM8KjUys14vQBnhB
   A==;
X-CSE-ConnectionGUID: i0zYZppWQRujwTVEPA3C3A==
X-CSE-MsgGUID: tJywnziMS6OUFfNoACaTAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48399183"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48399183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 19:25:42 -0800
X-CSE-ConnectionGUID: pGeiW06QRgC2unHlctenaQ==
X-CSE-MsgGUID: cNe1mltgTL6TwFBhawgDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104496936"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2025 19:25:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXB53-000Mfv-1I;
	Mon, 13 Jan 2025 03:25:33 +0000
Date: Mon, 13 Jan 2025 11:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andrey Albershteyn <aalbersh@redhat.com>,
	linux-api@vger.kernel.org, monstr@monstr.eu, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	arnd@arndb.de, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <202501131033.KKMmoHBV-lkp@intel.com>
References: <20250109174540.893098-1-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sh@vger.kernel.org
List-Id: <linux-sh.vger.kernel.org>
List-Subscribe: <mailto:linux-sh+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sh+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109174540.893098-1-aalbersh@kernel.org>

Hi Andrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on geert-m68k/for-next powerpc/next powerpc/fixes s390/features linus/master v6.13-rc6 next-20250110]
[cannot apply to geert-m68k/for-linus deller-parisc/for-next jcmvbkbc-xtensa/xtensa-for-next arnd-asm-generic/master tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/fs-introduce-getfsxattrat-and-setfsxattrat-syscalls/20250110-014739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250109174540.893098-1-aalbersh%40kernel.org
patch subject: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
config: m68k-randconfig-r122-20250111 (https://download.01.org/0day-ci/archive/20250113/202501131033.KKMmoHBV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250113/202501131033.KKMmoHBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131033.KKMmoHBV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/inode.c:957:24: sparse: sparse: context imbalance in 'inode_lru_isolate' - wrong count at exit
   fs/inode.c:1058:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:1099:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1829:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1947:20: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1961:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:2494:17: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
>> fs/inode.c:2998:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:2998:39: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:2998:39: sparse:     got struct fsxattr *fsx
   fs/inode.c:3032:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:3032:41: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:3032:41: sparse:     got struct fsxattr *fsx

vim +2998 fs/inode.c

  2959	
  2960	SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
  2961			struct fsxattr *, fsx, int, at_flags)
  2962	{
  2963		struct fd dir;
  2964		struct fileattr fa;
  2965		struct path filepath;
  2966		struct inode *inode;
  2967		int error;
  2968	
  2969		if (at_flags)
  2970			return -EINVAL;
  2971	
  2972		if (!capable(CAP_FOWNER))
  2973			return -EPERM;
  2974	
  2975		dir = fdget(dfd);
  2976		if (!fd_file(dir))
  2977			return -EBADF;
  2978	
  2979		if (!S_ISDIR(file_inode(fd_file(dir))->i_mode)) {
  2980			error = -EBADF;
  2981			goto out;
  2982		}
  2983	
  2984		error = user_path_at(dfd, filename, at_flags, &filepath);
  2985		if (error)
  2986			goto out;
  2987	
  2988		inode = filepath.dentry->d_inode;
  2989		if (file_inode(fd_file(dir))->i_sb->s_magic != inode->i_sb->s_magic) {
  2990			error = -EBADF;
  2991			goto out_path;
  2992		}
  2993	
  2994		error = vfs_fileattr_get(filepath.dentry, &fa);
  2995		if (error)
  2996			goto out_path;
  2997	
> 2998		if (copy_fsxattr_to_user(&fa, fsx))
  2999			error = -EFAULT;
  3000	
  3001	out_path:
  3002		path_put(&filepath);
  3003	out:
  3004		fdput(dir);
  3005		return error;
  3006	}
  3007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

