Return-Path: <kernel-janitors+bounces-972-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F821821002
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 Dec 2023 23:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08AA1C21B59
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 Dec 2023 22:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A82C2EE;
	Sun, 31 Dec 2023 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvJWXKHS"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A2C147;
	Sun, 31 Dec 2023 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704062483; x=1735598483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNbHn5JZhY17vzo7hwS/CKhb0QyVaposJD+CErl8kwo=;
  b=DvJWXKHSVSL0BeZjhHjB2lBdOpm2Grbi7kFrELoVm3UzF0lZf1fUHj+8
   RI+X+JdbVf4DXKmdOYZKqQcsss964euTa+lwe9+upwxwoNK+UVtFxoSet
   5vwgInPVNTJlchhb7mla0qKSfisH7ppgcvVAOi9siqZp6n3SHv4ewB0fu
   sgSEOc+o0DMody7UULjvRYr4JUR0aEH+hn6uQ5V0iuacIhNQ4TQKdjMt7
   pqpzj9n2J9NpKe9f2+Z+x4epNRBxIwQTEp1xwwcvvnf9moBilwq3xsEI5
   S7wU/aX7p/h5br4AsiRjBokRPTspXRsXtYhQlxe295fLTgDX80Hoyvn4m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="463172294"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="463172294"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 14:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="849735592"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="849735592"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Dec 2023 14:41:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rK4Ue-000JnI-26;
	Sun, 31 Dec 2023 22:41:16 +0000
Date: Mon, 1 Jan 2024 06:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jan Karcher <jaka@linux.ibm.com>,
	Paolo Abeni <pabeni@redhat.com>, Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] net/smc: Improve exception handling in
 smc_llc_cli_add_link_invite()
Message-ID: <202401010657.eexbMD1F-lkp@intel.com>
References: <5253e660-6b66-4775-ae2f-06f5a1d40be5@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5253e660-6b66-4775-ae2f-06f5a1d40be5@web.de>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.7-rc7 next-20231222]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Elfring/net-smc-Return-directly-after-a-failed-kzalloc-in-smc_fill_gid_list/20231231-231406
base:   net/main
patch link:    https://lore.kernel.org/r/5253e660-6b66-4775-ae2f-06f5a1d40be5%40web.de
patch subject: [PATCH 2/2] net/smc: Improve exception handling in smc_llc_cli_add_link_invite()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240101/202401010657.eexbMD1F-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401010657.eexbMD1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401010657.eexbMD1F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/smc/smc_llc.c: In function 'smc_llc_cli_add_link_invite':
>> net/smc/smc_llc.c:1175:41: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
    1175 |             lgr->type == SMC_LGR_SINGLE && lgr->max_links <= 1)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~


vim +1175 net/smc/smc_llc.c

  1160	
  1161	/* as an SMC client, invite server to start the add_link processing */
  1162	static void smc_llc_cli_add_link_invite(struct smc_link *link,
  1163						struct smc_llc_qentry *qentry)
  1164	{
  1165		struct smc_link_group *lgr = smc_get_lgr(link);
  1166		struct smc_init_info *ini;
  1167	
  1168		if (lgr->smc_version == SMC_V2) {
  1169			smc_llc_send_request_add_link(link);
  1170			goto free_qentry;
  1171		}
  1172	
  1173		if (lgr->type == SMC_LGR_SYMMETRIC ||
  1174		    lgr->type == SMC_LGR_ASYMMETRIC_PEER ||
> 1175		    lgr->type == SMC_LGR_SINGLE && lgr->max_links <= 1)
  1176			goto free_qentry;
  1177	
  1178		ini = kzalloc(sizeof(*ini), GFP_KERNEL);
  1179		if (!ini)
  1180			goto free_qentry;
  1181	
  1182		ini->vlan_id = lgr->vlan_id;
  1183		smc_pnet_find_alt_roce(lgr, ini, link->smcibdev);
  1184		if (!ini->ib_dev)
  1185			goto out;
  1186	
  1187		smc_llc_send_add_link(link, ini->ib_dev->mac[ini->ib_port - 1],
  1188				      ini->ib_gid, NULL, SMC_LLC_REQ);
  1189	out:
  1190		kfree(ini);
  1191	free_qentry:
  1192		kfree(qentry);
  1193	}
  1194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

