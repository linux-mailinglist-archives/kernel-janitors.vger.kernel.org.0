Return-Path: <kernel-janitors+bounces-10118-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDgBOJUSgmkgPAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10118-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:21:57 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294FDB391
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8CFF306C7D3
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Feb 2026 15:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FFA3B8BD9;
	Tue,  3 Feb 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGWX872m"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF679350A27;
	Tue,  3 Feb 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132092; cv=none; b=McgV79I7SNEliYY4QhHmkRA0tgRdu/7corY1masdMLEzlD+38PKzLljqY62NXR70UzN/m9nEXurj2CymkBx4gp1DUxysw5aFJrBua4Q8brCBh9XP8/ug6g8Ec0E3a2ZK2YZ2Aq+O/lbOsXjTRd7c5ZzHR5Gg48aZo17QLsGl9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132092; c=relaxed/simple;
	bh=4N4Zl6AuaOdTdSp7HLbqsgQd9MxKfXceeRvesZYrGoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP3e26+APgsfr/pdDdocOeC/MgLxtTn2D0zO4I3YG+Vvl34EdULnKfnFp6fyDktpiR+ZjUi+p5fsQxg55SijhAcF+GGFmAliaDXAyxghpH/ZHzW4c4LmElqVD7tg0kMmVYDryzOR5yGJyv1ShPxP+yhh6rYTaapj6ugiJrdCbAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGWX872m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770132090; x=1801668090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4N4Zl6AuaOdTdSp7HLbqsgQd9MxKfXceeRvesZYrGoc=;
  b=dGWX872m0M4jGJe2rEdzjrY64dTB9FxkzH37ysF9F2v+yku3ZvnBkp+8
   rXvNuKGlL2wMZPpvGtmSNIfpBe3E7hT9xgYOoZEQMj77niZSK2Yp/dfWR
   +BO1IBZ/Q32L4TkQROZgDr+Mxp1u9TVveLlCzBnpoZAr5EYMEhaS0WkmQ
   ZCFem2QlMegN6PCsio8pX74Mkrl5Kg3Z3qLYaW27FTWa2PekrFGv5E3DB
   CKODG8sW2zE+rTHO8kxe7NA60WtJbkCD1xCOLSxu1O66LKgyvYu9nTb9C
   bHBoB43C0rllC4iyNF/2wCkl35nHqS6r2961y99A5HGrbozBmOOOvc4DF
   Q==;
X-CSE-ConnectionGUID: NqJHBRYnS+q4+DCbLEKmqQ==
X-CSE-MsgGUID: zuEegu9iS4a9awM4kWQgEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82734311"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82734311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:21:30 -0800
X-CSE-ConnectionGUID: A47mN5MqQE++ztpBGHnV6w==
X-CSE-MsgGUID: FzI0L92hSzyV7HIfvT+Ecw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:21:27 -0800
Date: Tue, 3 Feb 2026 17:21:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com, David Lechner <dlechner@baylibe.com>
Subject: Re: [PATCH v3 next 3/6] iio: sca3000: switch IRQ handling to devm
 helpers
Message-ID: <aYISdbPlwg6q5qD1@smile.fi.intel.com>
References: <20260203122109.689669-1-harshit.m.mogalapalli@oracle.com>
 <20260203122109.689669-4-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203122109.689669-4-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org,baylibe.com];
	TAGGED_FROM(0.00)[bounces-10118-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 7294FDB391
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:20:47AM -0800, Harshit Mogalapalli wrote:
> Convert the threaded IRQ registration to devm_request_threaded_irq() so
> that the probe and remove paths can drop manual freeing of irqs.
> 
> No functionality change.

Right, taking this into account my other reply can be addressed separately.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



