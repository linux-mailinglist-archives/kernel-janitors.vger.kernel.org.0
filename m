Return-Path: <kernel-janitors+bounces-4575-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481E92DE72
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 04:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BF141C214FD
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jul 2024 02:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112A0171AF;
	Thu, 11 Jul 2024 02:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="F0zKcjiI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049BC14294
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 02:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720665357; cv=none; b=TdLEgcirJ7LT1mFfqXTnHCkR1gAbn5NRUSRvS36MKqRbgBdx2XTJTp/EVEMl191HgU6nwT+X7TBQLPNAaJ5s5/Wg8mZ9L9FAAFQKvE7/IGCp7FigjhPj2SAZMeXdBMdjePM9A/vamEJanpYJAODf+Nww5dvL9syC5znf+kVjfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720665357; c=relaxed/simple;
	bh=mVlNPKvgBDmHjNlih/T7Trzg9IL5n3ionbhTdiuuJfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXWjCbBVsiX4bLfoBHrTJLUFraFWvm8wAmxGPnomrOptaGHjqrqlObjuoTZ09Zi24UhLn2ugx/M0/+MP5qplbFRIhdY3OfhBN/8SEU1kZNHgOUrIi3ZHGt4b9BwKwiuGLeGb8+7TpdENVTqGv4NRIR8DguabHK5Gq48T/CMTStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=F0zKcjiI; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-116-79.bstnma.fios.verizon.net [173.48.116.79])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46B2Zhia025454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 22:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1720665345; bh=KCKUSCnJZej2EOEp8Kf3hF/vp94UjZHAqgQFUyfnS0w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F0zKcjiIDwZzLl2WJbgXcHpQlgp1RRqAwVUwL+a0PzeoUR6AM6pmoCYF6Qnwm67kd
	 C/JN7iciSBD9T6qbYLiK0vu5MfwEaj4HgmNHl+SYzHvgiZg2GKhEE3mI7XVw+ZEov6
	 4gn3ROMxgCtBR80lY6l6ReMGhCtcUqL1j+5FiCOl0WT4B4KurBqeJM6NAUa5DR+9cQ
	 aktl24Jp0pcv3IdF6+iXT2HZv14v1y+m4hZP5oI4H5g1Q7GxAKWvNfZw60UsFrpT0u
	 h6nff4G994Lz/QxC3Zs1Qp2LdvXrCHC++LQiYkHeyM0Hn0sbUPVnnVSTIvJz4Dy3CB
	 yjFlznZCrmd+w==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id D447415C18FD; Wed, 10 Jul 2024 22:35:41 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger.kernel@dilger.ca>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs: ext4: add missing MODULE_DESCRIPTION()
Date: Wed, 10 Jul 2024 22:35:34 -0400
Message-ID: <172066485811.400039.15583789810159631305.b4-ty@mit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240527-md-fs-ext4-v1-1-07aad5936bb1@quicinc.com>
References: <20240527-md-fs-ext4-v1-1-07aad5936bb1@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 May 2024 11:02:29 -0700, Jeff Johnson wrote:
> Fix the 'make W=1' warning:
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
> 
> 

Applied, thanks!

[1/1] fs: ext4: add missing MODULE_DESCRIPTION()
      commit: 7378e8991a459f3e5672e4b06bf346adce062fd8

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>

