Return-Path: <kernel-janitors+bounces-10142-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODWDCusLg2k+hAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10142-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:05:47 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC52E38B4
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8936F301373B
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Feb 2026 09:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11263A1A2F;
	Wed,  4 Feb 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl8cZ1dG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E8838F229;
	Wed,  4 Feb 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195868; cv=none; b=PO3riT1EYHGycFZ/yYbxW2YvcL4fO4BsWCpyQqRLeEcQGb9xLwnsVrJSswe+uG2geUlIyVbysxhGZnEb8O4CgAVv1Qa+V1Qc69JiEnS5xRlOF2u8fGWc1Ra4pY1GnejZkPqNbFGa/XiItYX/z/a7LpFXjJPXGuJmRCpjY3haqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195868; c=relaxed/simple;
	bh=M+vWK7sKLLnNbVd7LqxMHVuEyMxj5VyxnjX/VonKCAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd7+01f3NBYbhUcB6C1lkBvqflD2qZYWpJelbz2z4qa0L8Ci84CmbhhgyUXNmKk3lziFX67ikRQ+MQj2J3Q0XZisIy7S+MXHwTcN7AD6EmRVgUCXihnO7HwHO53bMekEGg6l9gkkGbgslp6XtsFIIdi5QhGRik0GgPBxCWvqzBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl8cZ1dG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770195868; x=1801731868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+vWK7sKLLnNbVd7LqxMHVuEyMxj5VyxnjX/VonKCAU=;
  b=Xl8cZ1dGFlUQTXRgnr4SAPv7nuoPz8v7OWZJ50sRHrWNqScJJ8Mkt2TG
   UBhJinEpjr3ffNgEzoP/D+tmTAduekYrExT4FiueIvbeK69koB1b6pQa/
   wmFuqYBgvTO8+1Lpp7dbMlGpII0g7p+5STIF9sAUZjCtf+e3MWHao7fGN
   cdPA0eHan5I/d6O06r6x1lHswMHyi7CgtmOaXR8AKHgU3+So5t2CkE0hf
   C0Ni5/BxlAfFMZTk9qfclyAEMMu7xkF0iNKrNEkqrnFXMlFXnGEDbp4Uu
   uyMP2FaVI0rrow6uyG+DfAHjFSd/U8M3uM4GU41WQ9ccl1W7CZhcxn6w1
   g==;
X-CSE-ConnectionGUID: o4hTXknDSLGZL8KGVLdtvA==
X-CSE-MsgGUID: xfdCX6eoQ4aehh65wnqq2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71274373"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71274373"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:04:27 -0800
X-CSE-ConnectionGUID: waPV5WEPTsuF8EkNl3Z1Vw==
X-CSE-MsgGUID: GhwomYxPSZGoU7n902YqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210151008"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:04:24 -0800
Date: Wed, 4 Feb 2026 11:04:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gustavo Bastos <gustavobastos@usp.br>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v4 next 6/6] iio: sca3000: manage device registration
 with devm helper
Message-ID: <aYMLlij_VDbxcxbI@smile.fi.intel.com>
References: <20260204061219.791037-1-harshit.m.mogalapalli@oracle.com>
 <20260204061219.791037-7-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204061219.791037-7-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,usp.br,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10142-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: BEC52E38B4
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:12:01PM -0800, Harshit Mogalapalli wrote:
> Convert the iio registration to use devm_* helpers so the probe no
> longer needs a separate cleanup path and remove callback can also drop
> the unregister. After this there is no need for having a remove
> callback, so remote it.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



